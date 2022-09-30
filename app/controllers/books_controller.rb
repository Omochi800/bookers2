class BooksController < ApplicationController
  before_action :authenticate_user!
   before_action :correct_book,only: [:edit]

  def new
    @book = Book.new
  end

  def create
    @user = current_user
    @book = Book.new(book_params)
    @book.user_id = current_user.id
  if@book.save
    flash[:notice] = "Book was successfully created."
    redirect_to book_path(@book.id)
  else
    @books = Book.all
    @user = User.find(current_user.id)
    render :index
  end
  end


  def index


    @books = Book.all
    @book = Book.new
    @user = current_user
    @users = User.all


  end

  def show

    @book = Book.find(params[:id])
    @user = User.find(@book.user.id)

  end

  def edit
    @book = Book.find(params[:id])


  end

  def update
    @book = Book.find(params[:id])
    @book.user_id = current_user.id

  if @book.update(book_params)
     flash[:notice] = "Book was successfully updated."
     redirect_to book_path(@book.id)
  else
     render :edit



  end
  end



  def destroy
    @book = Book.find(params[:id])

    @book.destroy
    redirect_to books_path
  end


  private

  def book_params
    params.require(:book).permit(:profile_image,:title,:body)
  end

   def correct_book
        @book = Book.find(params[:id])
    unless @book.user.id == current_user.id
      redirect_to books_path
    end
   end



end


