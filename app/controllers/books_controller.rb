class BooksController < ApplicationController
  def index
    @books = Book.all
    @categories = Category.all
    @book = Book.new
    if session[:user_id]
      @current_user = User.find(session[:user_id])
    end
  end

  def create
    @book = Book.new
    @categories = Category.all
    @books = Book.all
    @book.title = params[:title]
    @book.category_id = params[:category_id]
    if @book.save
      flash[:success] = "Le livre a été créé."
      redirect_to "/books"
    else
      flash[:failure] = "Le livre n'a pas pu être créé."
      if session[:user_id]
        @current_user = User.find(session[:user_id])
      end
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
      flash[:success] = "Le livre a été mis à jour."
      redirect_to "/books/#{params[:id]}"
    else
      @categories = Category.all
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
