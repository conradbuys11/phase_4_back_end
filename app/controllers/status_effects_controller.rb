class StatusEffectsController < ApplicationController
    def show
        se = StatusEffect.find(params[:id])
        render json: se.to_json()
    end
end
