class UsersController < ApplicationController
  def new
  end

  def create
    user = User.new(user_params)
    if user.save
      session[:user_id] = user.id
      flash[:success] = "Welcome, #{user.name}!"
      redirect_to "/dashboard"
    else
      flash[:fail] = user.errors.full_messages.to_sentence.to_s
      redirect_to "/register"
    end
  end

  def show
    @user = User.find(session[:user_id])
  end

  def discover
    @user = User.find(session[:user_id])
    @facade = MovieFacade.new
  end

  def movies
    @user = User.find(session[:user_id])
    @facade =
      if params[:title].nil?
        MovieFacade.new.top_movies
      else
        MovieFacade.new.search(params[:title])
      end
  end

  def login_form
  end

  def login_user
    @user = User.find_by(email: params[:email])
    if @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect_to "/dashboard"
    else
      flash[:invalid] = "Invalid email or password"
      redirect_to "/login"
    end
  end

  private

  def user_params
    params.permit(:name, :email, :password, :password_confirmation)
  end
end
