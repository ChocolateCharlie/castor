class BooksController < ApplicationController
  def index
    @book = Book.new
  end

  def create
    @book = Book.new
    @book.title = params[:title]
    @book.category_id = params[:category_id]
    if @book.save
      flash[:success] = "Le livre a été créé."
      redirect_to "/books"
    else
      flash[:failure] = "Le livre n'a pas pu être créé."
      render 'index'
    end
  end

  def show
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    if @book.update title: params[:title], category_id: params[:category_id]
      flash[:success] = "Le livre a été mis à jour."
      redirect_to "/books/#{params[:id]}"
    else
      @book.title = Book.find(params[:id]).title
      @book.category = Book.find(params[:id]).category
      flash[:failure] = "Le livre n'a pas été mis à jour."
      render 'show'
    end
  end

  def destroy
    Book.find(params[:id]).destroy
    flash[:success] = "Le livre a été supprimé."
    redirect_to "/books"
  end
end
