class RegistrationsController < Devise::RegistrationsController
	def create
		super
		if resource.save
			resource.role = params[:role]
			binding.pry
			resource.save
		end
	end
end
