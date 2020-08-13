class SessionsController < ApplicationController
  def new
  end
  def show
    @user=User.find_by(params[:id])
  end
  def create
      @user=User.find_by(email: params[:user][:email])
      if @user && @user.authenticate(params[:user][:password])
        log_in(@user)
        redirect_to books_path(@user),notice: "you were login "
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
