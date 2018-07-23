class BooksController < ApplicationController
  def index
    @book = Book.new
  end

  def create
    check_user_role("admin")
    @book = Book.new
    @book.title = params[:book][:title]
    @book.category_id = params[:book][:category_id]
    @book.author_id = params[:book][:author_id]
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
    check_user_role("admin")
    @book = Book.find(params[:id])
    if @book.update book_params
      flash[:success] = "Le livre a été mis à jour."
      redirect_to "/books/#{params[:id]}"
    else
      @book.title = Book.find(params[:id]).title
      @book.category = Book.find(params[:id]).category
      @book.author = Book.find(params[:id]).author
      flash[:failure] = "Le livre n'a pas été mis à jour."
      render 'show'
    end
  end

  def destroy
    check_user_role("admin")
    Book.find(params[:id]).destroy
    flash[:success] = "Le livre a été supprimé."
    redirect_to "/books"
  end

  private

  def book_params
    params.require(:book).permit(:title, :category_id, :author_id)
  end

  def check_user_role (role)
    if @current_user.try(:role) != role
      flash[:error] = "Accès interdit"
      return redirect_to request.referrer || root_path
    end
  end
end
