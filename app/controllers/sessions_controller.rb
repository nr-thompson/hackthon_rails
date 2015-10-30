class SessionsController < ApplicationController
	def new
	end

	def create
		@user = User.find_by(email: params[:email])
		if @user && @user.authenticate(params[:password])
			log_in @user

			redirect_to "/home"
		else
			flash[:notice] = "Invalid"
			redirect_to '/home'
		end
	end

	#### facebook create method ####
	def fb_create
		user = User.from_omniauth(env["omniauth.auth"])
		session[:user_id] = user.id
		redirect_to "/home"
	end

	def destroy
		log_out
		redirect_to '/index'
	end
end
