class SessionsController < ApplicationController
	def new
  end

  def create
    user = User.find_by(email: params[:email])
    if user && User.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to '/documenations', notice: "Logged In!"
    else
      flash.now[:alert] = "Invalid email or password"
      render "new"
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to documentations_url, notice: "Logged out!"
  end
end
