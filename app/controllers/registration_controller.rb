class RegistrationsController < Devise::RegistrationsController
	def create
		super
		if resource.save
			resource.role = params[:role]
			resource.save
		end
	end
end
