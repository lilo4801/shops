class SessionsController < ApplicationController
  def new
  end
  def create
      @user=User.find_by(email: params[:user][:email])
      if @user && @user.authenticate(params[:user][:password])
        log_in(@user)
        redirect_to @user,notice: "you were login "
      else
        render :new,notice: "sign in  failed"
      end
  end
  def destroy
    log_out
    flash[:notice] = "You are logged out"
    redirect_to new_session_path
  end
end
