class SessionsController < ApplicationController
	skip_before_filter :require_login, :except => [:destroy]
  
  def new
    @user = User.new
  end
  
  def create
    if @user = login(params[:email],params[:password])
      redirect_back_or_to :root, notice: 'Login successfull.'
    else
    	flash.now[:alert] = "Invalid"
      render 'new'
    end
  end
  
  def destroy
    logout
    redirect_to(:root, :notice => 'Bye')
  end
end
