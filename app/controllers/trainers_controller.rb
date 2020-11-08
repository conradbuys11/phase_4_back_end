class TrainersController < ApplicationController
    def show
        trainer = Trainer.find_by(strong_params)
        render json: 
    end

    private
    def strong_params
        params.require(:trainer).permit(:id)
    end
end
