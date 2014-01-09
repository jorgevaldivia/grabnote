class Users::PasswordsController < ApplicationController

  before_action :set_user

  respond_to :html

  def edit
  end

  def update
    if @user.update(user_params)
      # Sign in the user by passing validation in case his password changed
      sign_in @user, :bypass => true
      redirect_to edit_user_passwords_path, notice: t("success_notice.update", name: t("activerecord.attributes.user.password"))
    else
      render "edit"
    end
  end

  private

    def set_user
      # Get undecorated user
      @user = User.find(current_user.id)
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:password, :password_confirmation)
    end


end
