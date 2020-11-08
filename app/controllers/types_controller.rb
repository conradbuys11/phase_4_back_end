class TypesController < ApplicationController

    def index
        types = Type.all
        render json: types.to_json
    end

    def show
        type = Type.find_by(strong_params)
        render json: type.to_json
    end
    
    private
    def strong_params
        params.require(:type).permit(:name, :value)
    end
end
