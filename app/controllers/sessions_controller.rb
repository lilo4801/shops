class SessionsController < ApplicationController
   skip_before_action :verify_authenticity_token
  def new
  end
  def show
    @user=User.find_by(params[:id])
  end
  def create
      @user=User.find_by(email: params[:user][:email])
      if @user && @user.authenticate(params[:user][:password])
        log_in(@user)
        render json: { data: @user}, status: :created
      else
        render json: {}, status: :unprocessable_entity
      end
  end
  def destroy
    @user = User.find_by(params[:id])
    if @user
     log_out()
     render json: {},head: :no_content,status: :no_content
   end
  end
end
