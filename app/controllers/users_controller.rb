class UsersController < ApplicationController
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to weather_path
    else
      render :new
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
end
