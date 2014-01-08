class Users::SettingsController < ApplicationController

  before_action :set_user

  respond_to :html

  def edit
  end

  def update
    if @user.update_attributes(user_params)
      redirect_to edit_user_settings_path, notice: t("success_notice.update", name: t("activerecord.models.user.profile"))
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
      params.require(:user).permit(:first_name, :last_name, :time_zone)
    end
end
