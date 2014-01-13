class User < ActiveRecord::Base

  include Omniauthable

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable  

  validates :first_name, :last_name, presence: true

  has_many :authentications, dependent: :destroy
  has_many :notebooks

  # Collaborations
  has_many :collaborator_joins
  has_many :note_collaborations, through: :collaborator_joins, source: :collaboratable, source_type: "Notebook::Note"
  has_many :notebook_collaborations, through: :collaborator_joins, source: :collaboratable, source_type: "Notebook"
  has_many :project_collaborations, through: :collaborator_joins, source: :collaboratable, source_type: "Project"

  mount_uploader :profile_image, ProfileImageUploader

  after_create :generate_firebase_auth_token

  # If user is singing up with omniauth, we dont want to require the password
  # just yet.
  def password_required?
    (!has_external_authentication? || !password.blank?) && super
  end

  # Update user password if user updated with omniauth
  def update_with_password(params, *options)
    if encrypted_password.blank?
      update_attributes(params, *options)
    else
      super
    end
  end

  # Returns whether or not user authenticates via a third party
  # (twitter/facebook)
  def has_external_authentication?
    authentications.any?
  end

  def generate_firebase_auth_token
    if firebase_auth_token_stale?
      # Expire the token way in the future (year 2047)
      options = {expires: 2430958469}
      auth_data = {user_id: "#{self.id}"}

      generator = FirebaseToken::FirebaseTokenGenerator.new(ENV["FIREBASE_APP_SECRET"])

      self.firebase_auth_token = generator.create_token(auth_data, options)
      self.firebase_auth_token_generated_at = DateTime.now
      self.save
    end
  end

  def firebase_auth_token_stale?
    self.firebase_auth_token_generated_at.blank? || self.firebase_auth_token_generated_at + 24.hours <= DateTime.now
  end
end
