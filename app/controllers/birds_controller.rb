class BirdsController < ApplicationController
  # def index
  #   birds = Bird.all
  #   render json: birds
  # end

  # def index
  #   birds = Bird.all
  #   render json: birds, only: [:id, :name, :species]
  # end

  # or 

  def index
    birds = Bird.all
    render json: birds, except: [:created_at, :updated_at]
  end

  # this is the same as above just fully written to show that except is a to_json method
  # def index
  #   birds = Bird.all
  #   render json: birds.to_json(except: [:created_at, :updated_at])
  # end

  # def show
  #   birds = Bird.find_by(id: params[:id])
  #   render json: birds
  # end

  # def show
  #   bird = Bird.find_by(id: params[:id])
  #   render json: {id: bird.id, name: bird.name, species: bird.species } 
  # end

  # def show
  #   bird = Bird.find_by(id: params[:id])
  #   render json: bird.slice(:id, :name, :species)
  # end

  def show
    bird = Bird.find_by(id: params[:id])
    if bird
      render json: { id: bird.id, name: bird.name, species: bird.species }
    else
      render json: { message: 'Bird not found' }
    end
  end
end