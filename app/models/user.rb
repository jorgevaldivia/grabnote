class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable  

  # Only require fields if user is signing up directly (not via 3rd party)
  validates :first_name, :last_name, presence: true#, 
    #if: Proc.new{ |x| x.authentications.empty? }

  has_many :authentications
  has_many :notebooks
  has_many :project_collaborators
  has_many :projects, :through => :project_collaborators

  # Populate user fields from omniauth vars
  def apply_omniauth(omni)
    authentications.build(:provider => omni['provider'],
    :uid => omni['uid'],
    :token => omni['credentials'].token,
    :token_secret => omni['credentials'].secret)
  end

  # If user is singing up with omniauth, we dont want to require the password
  # just yet.
  def password_required?
    (authentications.empty? || !password.blank?) && super
  end

  # Update user password if user updated with omniauth
  def update_with_password(params, *options)
    if encrypted_password.blank?
      update_attributes(params, *options)
    else
      super
    end
  end
end
