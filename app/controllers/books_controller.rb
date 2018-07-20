class BooksController < ApplicationController
  def index
    @books = Book.all
  end

  def create
    Book.create title: params[:title]
    redirect_to "/books"
  end

  def show
    @book = Book.find(params[:id])
  end

  def update
    Book.find(params[:id]).update title: params[:title]
    redirect_to "/books/#{params[:id]}"
  end
end
