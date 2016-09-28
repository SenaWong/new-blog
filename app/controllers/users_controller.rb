class UsersController < ApplicationController

	def new
		@user = User.new
	end

	def create
		@user = User.new(user_params)
		if @user.save
			flash[:success] = "Welcome to the alpha blog #{@user.username}"
			session[:user_id] = @user.id
			redirect_to articles_path
		else
			flash[:danger] = "There was something wrong with your registration details"
			render 'new'
		end
	end

	def index

	end



	private

		def user_params
			params.require(:user).permit(:username, :email, :password)

		end

end