class ProfilesController < ApplicationController
  def index

  end

  def new
    
  end

  def create

  end

  def show

  end

  def edit

  end

  def update

  end

  def destroy

  end

  def save_profile_interests
  
    @movie = Movie.where(name: params[:movie])
    unless @movie.count > 0
      @movie = Movie.new(name: params[:movie])
      @movie.save
    end

    unless MoviePeople.where(user_id: current_user.id, movie_id: @movie.id).count > 0
      MoviePeople.create(user_id: current_user.id, movie_id: @movie.id)
    end
    
    data = {
      movie: params[:movie]
    }
    render json: data.to_json
  end
end
