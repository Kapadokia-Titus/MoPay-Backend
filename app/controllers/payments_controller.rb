class PaymentsController < ApplicationController
    def index
        payments = Payment.all
        render json:payments
    end

    def show
        payments = Payment.find_by(id: params[:id])
        render json:payments
    end

    def create
        payment = Payment.create(payment_params)
        if payment.valid?
          session[:payment_id] = payment.id
          render json: payment, status: :created
        else
          render json: { errors: payment.errors.full_messages }, status: :unprocessable_entity
        end
      end

      def payment_params
        params.permit(:card_name, :card_id, :card_number, :card_bank,:amount, :status, :receiver_email,:user_id)
      end

      def destroy
        payment = Payment.find_by(id: params[:id])
        if payment
          payment.destroy
          head :no_content
        else
          render json: { error: "Card not found" }, status: :not_found
        end
      end
end
