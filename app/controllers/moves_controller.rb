class MovesController < ApplicationController
    def show
        move = Move.find(params[:id])
        render json: move.to_json
    end
end
