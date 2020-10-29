class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:show,:edit,:index,:update]
  before_action :correct_user, only: [:edit, :update]
  # def login
  #   @user = User.find_by(email: params[:email], password: params[:password])
  #   if @user
  #     flash[:notice] = "Welcome! You have signed up successfully."
  #     redirect_to user_path
  #   else
  #     render new_user_session_path
  #   end
  # end

  def index
    @users = User.all
    @user = User.new
  end

  def show
    @user = User.find(params[:id])
    @books = @user.books
    @book = Book.new
  end

  # def create
  #   @user = User.new(user_params)
  #   @user.save
  #   flash[:notice] = "You have created book successfully."
  #   redirect_to root_path
  # end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
    flash[:notice] = "User was successfully updated."
    redirect_to user_path(@user)
    else
    render 'edit'
    end
  end

  private
  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image)
  end

  def correct_user
    user = User.find(params[:id])
    if user != current_user
    redirect_to user_path(current_user)
    end
  end

end