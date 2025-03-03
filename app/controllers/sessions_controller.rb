class SessionsController < ApplicationController 
  def new
		@user = User.new
	end
  
  def create
    @user = User.find_by(email: params[:user][:email])
    if @user && @user.authenticate(params[:user][:password])
      session[:user_id] = @user.id
      redirect_to root_path, notice: "Logged in!"
    else
      flash.now[:alert] = "Invalid email or password"
      render :new
    end
  end

  def destroy
  session[:user_id] = nil
    flash[:notice]="Logged Out"
    redirect_to '/login'
  end

end
  