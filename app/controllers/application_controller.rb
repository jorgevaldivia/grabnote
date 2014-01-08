class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  layout :set_layout

  add_breadcrumb I18n.t("nav.home"), :root_path

  before_action :configure_permitted_parameters, if: :devise_controller?


  # Override devise's current_user method so that a decorated instance is
  # returned instead.
  def current_user
    UserDecorator.decorate(super) unless super.nil?
  end

  protected

  def set_layout
    if devise_controller?
      "devise"
    else
      "detail_admin"
    end
  end


  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) << :first_name
    devise_parameter_sanitizer.for(:sign_up) << :last_name
  end
end
