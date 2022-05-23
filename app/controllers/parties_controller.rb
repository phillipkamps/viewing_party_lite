class PartiesController < ApplicationController
  def new
    @user = User.find(params[:user_id])
    @movie = MovieService.get_movie(params[:movie_id])
    @users = User.all
    @party = Party.new
  end

  def create
    user = User.find(params[:user_id])
    user.parties.create!(party_params)
    redirect_to "/users/#{user.id}"
  end

  private

  def party_params
    params.require(:party).permit(:length, :date, :start_time, user_ids: [])
  end
end
