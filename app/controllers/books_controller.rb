class BooksController < ApplicationController
  def index
    @books = Book.all
    @categories = Category.all
    @book = Book.new
  end

  def create
    @book = Book.new
    @categories = Category.all
    @books = Book.all
    @book.title = params[:title]
    @book.category_id = params[:category_id]
    if @book.save
      redirect_to "/books"
    else
      render 'index'
    end
  end

  def show
    @categories = Category.all
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    if @book.update title: params[:title], category_id: params[:category_id]
      redirect_to "/books/#{params[:id]}"
    else
      @categories = Category.all
      @book.title = Book.find(params[:id]).title
      @book.category = Book.find(params[:id]).category
      render 'show'
    end
  end

  def destroy
    Book.find(params[:id]).destroy
    redirect_to "/books"
  end
end
