class BooksController < ApplicationController
  def index
    @books = Book.all
    @book = Book.new
    @new_book = Book.new
  end

  def show
    @book = Book.find(params[:id])
  end

  def edit
    @book = Book.find(params[:id])
  end

  def create
    @new_book = Book.new(book_params)
    if @new_book.save
      flash.notice = "Book was successfully created."
      redirect_to book_path(@new_book.id)
    else
      @books = Book.all
      @book = Book.new
      render 'books/index'
    end

  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      flash.notice = "Book was successfully updated."
      redirect_to book_path(params[:id])
    else
      render "books/edit"
    end
  end

  def destroy
    @book = Book.find(params[:id])
    if @book.destroy
      flash.notice = "Book was successfully destroyed."
    end
    redirect_to books_path
  end

  def book_params
    params.require(:book).permit(:title, :body)
  end
end
