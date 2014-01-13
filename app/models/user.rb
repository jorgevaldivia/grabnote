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
end
