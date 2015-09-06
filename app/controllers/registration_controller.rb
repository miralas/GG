class RegistrationsController < Devise::RegistrationsController
    def create
        super
        if resource.save
            resource.role = params[:role]
            resource.save
        end
    end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up).push(:name, :role)
  end
end
