# Some fields require a token when they are created (such as notebooks for
# the purpose of constructing a firebase url.
module HasToken
  extend ActiveSupport::Concern

  included do
    before_create :set_token
  end

  private

  def set_token
    token = SecureRandom.urlsafe_base64(16)
  end
end