# Omniauth related methods to handle third party auth logic,
module Omniauthable
  extend ActiveSupport::Concern# Populate user fields from omniauth vars
  def apply_omniauth(omni)
    authentications.build(:provider => omni['provider'],
      :uid => omni['uid'],
      :token => omni['credentials'].token,
      :token_secret => omni['credentials'].secret)

    self.send("set_#{omni['provider']}_info", omni)
  end

  # Set user info based on facebook response. Thankfully facebook returns quite
  # a good bit of info
  def set_facebook_info omni
    info              = omni.info
    self.email        = info.email
    self.first_name   = info.first_name
    self.last_name    = info.last_name

    # Get the large size image. Omniauth returns 'square' by default and thats
    # too small to use.
    if info.image.present?
      self.remote_profile_image_url = info.image.gsub("square", "large")
    end
  end

  # Set user info based on twitter response. The only useful info that twitter
  # returns is the profile image :(.
  def set_twitter_info omni
    info              = omni.info
    
    # Get profile image from twitter. Remove _normal to return normal size
    # (weird, right?)
    if info.image.present?
      self.remote_profile_image_url = info.image.gsub("_normal", "")
    end
  end
end