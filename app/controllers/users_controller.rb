class UsersController < ApplicationController
  def new
  end

  def create
    user = User.new(user_params)
    if user.save
      flash[:success] = "Welcome, #{user.name}!"
      redirect_to "/users/#{user.id}"
    else
      flash[:fail] = user.errors.full_messages.to_sentence.to_s
      redirect_to "/register"
    end
  end

  def show
    @user = User.find(params[:id])
  end

  def discover
    @user = User.find(params[:id])
    @facade = MovieFacade.new
  end

  def movies
    @user = User.find(params[:id])
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
      redirect_to "/users/#{@user.id}"
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
