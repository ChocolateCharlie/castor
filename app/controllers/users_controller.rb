class UsersController < ApplicationController
  def check
    @current_user = User.where(name: params[:name], password: params[:password]).first
    if @current_user
      session[:user_id] = @current_user.id
      flash[:info] = "Bienvenue #{@current_user.name} !"
      redirect_to "/books"
    else
      session[:user_id] = nil
      flash[:info] = "La connexion a échoué."
      redirect_to "/users/login"
    end
  end

  def login
  end

  def logout
    session[:user_id] = nil
    redirect_to "/books"
  end
end
