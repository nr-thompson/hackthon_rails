class UsersController < ApplicationController
	def home
	end

	def create
		user = User.new(user_params)
		if user.save
			flash[:success] = "User created"
			last_user = User.last
			log_in user
			redirect_to '/home'
		else
			flash[:errors] = user.errors.full_messages
			redirect_to '/home'
		end
	end




	def destroy
		session[:user_id] = nil
		flash[:notice] = "Logged out"
		redirect_to "/home"
	end


	private
	def user_params
		params.require(:user).permit(:name, :email, :password, :password_confirmation)
	end
end
