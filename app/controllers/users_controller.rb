class UsersController < ApplicationController
  def dashboard
    @user = User.find(params[:id])
  end

  def new
  end

  def create
    user = User.create!(user_params)
    redirect_to "/users/#{user.id}"
  end

  def show
    @user = User.find(params[:id])
  end

  def discover
    @user = User.find(params[:id])
    @facade = MovieFacade.new
  end

  def movies
    @facade = if params[:title].nil?
      MovieFacade.new.top_movies
    else
      @facade = MovieFacade.new.search
    end
  end

  private

  def user_params
    params.permit(:name, :email)
  end
end
