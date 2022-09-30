class UsersController < ApplicationController
   before_action :authenticate_user!
   before_action :correct_user,only: [:edit]
  def show
    @book = Book.new
    @user = User.find(params[:id])
    @books = @user.books


  end

  def edit
    @user = User.find(params[:id])

  end

  def update
    @user = User.find(params[:id])
    flash[:notice] = "user info was successfully updated."
  if@user.update(user_params)
    redirect_to user_path
  else
    render:edit
  end
  end

  def index
    @user = current_user
    @book = Book.new
    @users = User.all

    @books = Book.all
  end

  private

  def user_params
    params.require(:user).permit(:name,:profile_image,:introduction)
  end

  def correct_user
        @user = User.find(params[:id])
    unless @user.id == current_user.id
      redirect_to user_path(current_user.id)
    end
  end
end
