class MyRegister::RegistrationsController < Devise::RegistrationsController
	before_filter :configure_permitted_parameters
	def create
		super
		if resource.save
			resource.role = params[:user][:role]
			resource.name = params[:user][:name]
			resource.save
		end
	end

	protected

  	def configure_permitted_parameters
    	devise_parameter_sanitizer.for(:sign_up).push(:name, :role)
  	end
end
