class UsersController < ApplicationController
  def check
    @current_user = User.where(user_params).first
    if @current_user
      session[:user_id] = @current_user.id
      flash[:success] = "Bienvenue #{@current_user.name} !"
      redirect_to "/books"
    else
      session[:user_id] = nil
      flash[:failure] = "La connexion a échoué."
      redirect_to "/users/login"
    end
  end

  def list
    if @current_user.try(:admin?)
      @users = User.all
    else
      flash[:error] = "Accès interdit"
      return redirect_to request.referrer || root_path
    end
  end

  def login
  end

  def logout
    session[:user_id] = nil
    redirect_to "/books"
  end

  private

  def user_params
    params.require(:user).permit(:name, :password)
  end
end
