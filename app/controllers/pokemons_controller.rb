class PokemonsController < ApplicationController
    def index
        pokemon = Pokemon.all
        render json: pokemon.to_json(include: [:species, :status_effect, :moves])
    end

    def show
        #byebug
        pokemon = Pokemon.find(params[:id])
        render json: pokemon.to_json(include: [:species, :status_effect, :moves])
    end
    
    # private
    # def strong_params
    #     params.require(:pokemon).permit(:id)
    # end
end
