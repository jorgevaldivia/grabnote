require "#{Rails.root}/lib/firebase_token_generator.rb"

# Common methods shared among objects that have are represented in firebase.
module HasFirebase
  extend ActiveSupport::Concern

  included do
    after_create :set_firebase_data
    after_destroy :remove_firebase_data
  end

  # Update the collaborators in firebase
  def update_firebase_collaborators
    firebase = connect_to_firebase

    firebase.update(firebase_key, {collaborators: Hash[self.collaborator_ids.map{ |id| [id, id]}] })
  end

  private
  
  # Set firebase data (owner, init collaborators, etc) when record is created.
  def set_firebase_data
    firebase = connect_to_firebase

    set_firebase_owner firebase
  end

  # Remove data from firebase when record is destroyed
  def remove_firebase_data
    firebase = connect_to_firebase

    firebase.delete(firebase_key)
  end

  # Create a firebase instance
  def connect_to_firebase
    Firebase.new("https://#{ENV['FIREBASE_URL']}/", generate_admin_token)
  end

  # Generate an auth token for firebase that has admin abilities (can write and
  # read everything)
  def generate_admin_token
    generator = FirebaseToken::FirebaseTokenGenerator.new(ENV["FIREBASE_APP_SECRET"])
    generator.create_token({}, {admin: true})
  end

  # Set the owner of the object in firebase
  def set_firebase_owner firebase
    firebase.update(firebase_key, { owner_id: self.user_id })
  end
end