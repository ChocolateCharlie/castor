class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :set_common_variables
  before_action :set_current_user

  private

  def set_common_variables
    @authors = Author.all
    @books = Book.all
    @categories = Category.all
  end

  def set_current_user
    if session[:user_id]
      @current_user = User.find(session[:user_id])
    end
  end
end
