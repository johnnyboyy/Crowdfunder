class UsersController < ApplicationController

	def show
		@user = User.find(params[:id])
	end

	def new
		@user = User.new
	end

	def create
		@user = User.new(params[:user])

		if @user.save
			auto_login(@user)
			redirect_to :root, notice: "Account created"
		else
			render 'new', alert: "Try again"
		end
	end

	def destroy
		User.find(params[:id]).destroy
	end
end
