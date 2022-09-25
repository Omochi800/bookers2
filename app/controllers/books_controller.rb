class BooksController < ApplicationController
  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    @book.save
    redirect_to books_path
  end

  def index
    
    
    
    @book = Book.new
    @books = Book.all.order(created_at: :desc)
   
  end

  def show
    @book = Book.find(params[:id])
    @user = User.find(@book.user.id)

  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    book = Book.find(params[:id])
  if book.user != current_user
    redirect_to book_path(book.id)
  else
     book.update(book_params)
     redirect_to book_path(book.id)
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
end
