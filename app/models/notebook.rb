class Notebook < ActiveRecord::Base
  include HasCollaborators
  include HasToken
  include HasFirebase

  belongs_to :user

  validates :name, presence: true

  def firebase_key
    "notebooks/#{self.token}"
  end

end
