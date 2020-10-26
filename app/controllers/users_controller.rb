class UsersController < ApplicationController
  
  def login
    @user = User.find_by(email: params[:email], password: params[:password])
    if @user
      flash[:notice] = "Signed in successfully."
      redirect_to user_path
    else
      render new_user_session_path
    end
  end
  
  def index
    @users = User.all
  end
  
  def show
    @user = User.find(params[:id])
  end
  
  def create
    @user = User.new(user_params)
    user.save
    redirect_to root_path
  end
  
  def edit
    @user = User.find(params[:id])
  end

  private
  def user_params
    params.require(:book).permit(:title, :opinion)
  end
end