class UsersController < ApplicationController
  def index

  end
  def show
    @user=User.find(params[:id])
  end
  def new
    @user=User.new
  end

  def create
    @user=User.new(params_user)
    if @user.save
      redirect_to @user,notice: 'User created'
    else
      render :new,notice:'failed'
    end
  end
  private
  def params_user
    params.require(:user).permit(:email,:password,:password_confirmation,:name)
  end
end
