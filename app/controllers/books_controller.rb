class BooksController < ApplicationController
 before_action :authenticate_user!
 before_action :correct_user, only: [:edit, :up]

  def create

    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
    flash[:notice] = "You have created book successfully.."
    redirect_to book_path(@book)
    else
    @books = Book.all
    render 'index'
    end
  end
  def index
      @books = Book.all
      @book = Book.new
      @user = current_user
  end

  def show
      @book = Book.find(params[:id])
      @user = current_user
  end

  def edit
      @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
    flash[:notice] = "Book was successfully updated."
    redirect_to book_path(@book)
    else
    @books = Book.all
    render 'index'
    end
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    flash[:notice] = "Book was successfully destroyed."
    redirect_to books_path(@book)
  end

  private
  def book_params
    params.require(:book).permit(:title, :body)
  end

  def correct_user
    @book = Book.find(params[:id])
    if @book.user != current_user
    redirect_to books_path
    end
  end
end