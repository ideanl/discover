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
 
    @movie = Hobby.where(hobby: 'movie', name: params[:movie])
    unless @movie.count > 0
      @movie = Hobby.new(hobby: 'movie', name: params[:movie])
      @movie.save
    end
  
    unless HobbyPerson.where(hobby: 'movie', user_id: current_user.id, hobby_id: @movie.id).count > 0
      HobbyPerson.create(hobby: 'movie', user_id: current_user.id, hobby_id: @movie.id)
    end
    
    data = {
      movie: params[:movie]
    }
    render json: data.to_json
  end
end
