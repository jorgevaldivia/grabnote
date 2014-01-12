class AuthenticationsController < ApplicationController
  before_action :set_authentication, only: [:show, :edit, :update, :destroy]

  # GET /authentications
  # GET /authentications.json
  def index
    @authentications = current_user.authentications.all
  end

  # DELETE /authentications/1
  # DELETE /authentications/1.json
  def destroy
    @authentication.destroy
    respond_to do |format|
      format.html { redirect_to authentications_url }
      format.json { head :no_content }
    end
  end

  def twitter
    authenticate_omni(:twitter)
  end

  def facebook
    authenticate_omni(:facebook)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_authentication
      @authentication = Authentication.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def authentication_params
      params[:authentication]
    end

    def authenticate_omni(provider)
      omni = request.env["omniauth.auth"]
      # raise "\n******** #{omni.info.image}"
      # raise env["omniauth.auth"].to_yaml
      authentication = Authentication.find_by_provider_and_uid(omni['provider'], omni['uid'])

      if authentication
        flash[:notice] = "Logged in Successfully"
        sign_in_and_redirect User.find(authentication.user_id)
      elsif current_user
        token = omni['credentials'].token

        if provider == :twitter
          token_secret = omni['credentials'].secret
        else
          token_secret = ""
        end

        current_user.authentications.create!(:provider => omni['provider'], :uid => omni['uid'], :token => token, :token_secret => token_secret)
        flash[:notice] = "Authentication successful."
        sign_in_and_redirect current_user
      else
        user = User.new 
        user.apply_omniauth(omni)

        if user.save
          flash[:notice] = "Logged in."
          sign_in_and_redirect User.find(user.id)             
        else
          session[:omniauth] = omni.except('extra')
          redirect_to new_user_registration_path
        end
      end 
    end
end
