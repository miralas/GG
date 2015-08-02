class MyRegister::RegistrationsController < Devise::RegistrationsController
	def create
		super
		if resource.save
			resource.role = params[:user][:role]
			resource.name = params[:user][:name]
			binding.pry
			resource.save
		end
	end
end
