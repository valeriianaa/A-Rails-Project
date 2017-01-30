class RegistrationsController < Devise::RegistrationsController
  before_filter :configure_permitted_parameters, :only => [:create]
  skip_before_filter :require_no_authentication, only: [:new, :create, :cancel]
  # skip_before_filter :authenticate_scope!, only: [:new, :create]
  
  layout "application"

  def new
    super
  end

  def create
    build_resource(sign_up_params)

    resource.save
    yield resource if block_given?
    if resource.persisted?
      respond_with resource, location: after_sign_up_path_for(resource)
    else
      clean_up_passwords resource
      set_minimum_password_length
      respond_with resource
    end
  end

  def cancel
    super
  end

  def after_sign_up_path_for(resource)
    users_path
  end

  def after_update_path_for(resource)
    users_path
  end

  protected

    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:persona_id, :rol_id, :email, :password) }
    end

end
