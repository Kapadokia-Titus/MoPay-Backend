class CardsController < ApplicationController

    def index
        cards = Card.all
        render json:cards
    end

    def show
        card = Card.find_by(id: params[:id])
        render json:card
    end

    def create
        card = Card.create(card_params)
        if card.valid?
          session[:card_id] = card.id
          render json: card, status: :created
        else
          render json: { errors: card.errors.full_messages }, status: :unprocessable_entity
        end
      end

      def card_params
        params.permit(:card_name, :card_number,:user_id, :expiration, :card_bank, :cvv, :amount)
      end

      def destroy
        card = Card.find_by(id: params[:id])
        if card
          card.destroy
          head :no_content
        else
          render json: { error: "Card not found" }, status: :not_found
        end
      end
end
