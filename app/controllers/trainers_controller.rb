class TrainersController < ApplicationController
    def index
        trainers = Trainer.all
        render json: trainers.to_json(include: {trainer_category: {}, pokemons: {include: [:species => {include: [:types]}, :status_effect => {}, :moves => {include: [:move_status_effects => {include: [:status_effect]}, :status_effects, :type]}]}})
    end
    
    def show
        trainer = Trainer.find(params[:id])
        render json: trainer.to_json(include: [:trainer_category, :pokemons => {include: [:species => {include: [:types]}, :status_effect => {}, :moves => {include: [:move_status_effects => {include: [:status_effect]}, :status_effects, :type]}]}])
    end
end
