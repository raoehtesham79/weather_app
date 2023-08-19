class UsersController < ApplicationController
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(user_params)
    exising_user = User.find_by(email: @user.email)
    if exising_user.present?
      flash.now[:alert] = "This Email Already Exists"
      render :new and return
    end
    if @user.save
      session[:user_id] = @user.id
      redirect_to weather_index_path and return
    else
      render :new and return
    end
  end
  
  def show
    @user = User.find(params[:id])
  end

  def login
    if current_user
      redirect_to root_path, notice: "You are already logged in."
    end
  end

  def authenticate
    user = User.find_by(email: params[:email])

    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to root_path, notice: "Logged in successfully."
    else
      flash.now[:alert] = "Invalid email or password."
      render :login
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end
end
