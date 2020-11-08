class TrainersController < ApplicationController
    def index
        trainers = Trainer.all
        render json: trainers.to_json(include: {trainer_category: {}, pokemons: {include: [:species, :status_effect, :moves => {include: [:move_status_effects, :status_effects]}]}})
    end
    
    def show
        trainer = Trainer.find(params[:id])
        render json: trainer.to_json(include: [:trainer_category, :pokemons => {include: [:species, :status_effect, :moves => {include: [:move_status_effects, :status_effects]}]}])
    end
end
