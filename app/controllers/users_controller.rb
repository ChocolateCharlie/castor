class UsersController < ApplicationController
  def login
  end

  def check
    @current_user = User.where(name: params[:name], password: params[:password]).first
    if @current_user
      flash[:info] = "Bienvenue #{@current_user.name} !"
      redirect_to "/books"
    else
      flash[:info] = "La connexion a échoué."
      redirect_to "/users/login"
    end
  end
end
