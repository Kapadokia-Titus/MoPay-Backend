class UsersController < ApplicationController

    def index
        users=User.all
        render json:users
    end
    def create
        user = User.create(user_params)
        
        if user.valid?
          session[:user_id] = user.id
          render json: user, status: :created
          
          # initial data
          card_data = {
            amount: "1000",
            card_name:user.username, 
            card_number:"3458"+user.phone, 
            user_id:user.id, 
            expiration:"12/23", 
            card_bank: "MORICOIN", 
            cvv:"123"
          }
          @card = Card.new(card_data)
          @card.save
        else
          render json: { errors: user.errors.full_messages }, status: :unprocessable_entity
        end
      end
    
      def show
        user = User.find_by(id: session[:user_id])
        if user
          render json: user
        else
          render json: { error: "Not authorized" }, status: :unauthorized
        end
      end
    
      private
    
      def user_params
        params.permit(:username, :password,:email, :gender, :phone, :password_confirmation)
      end
     
      def destroy
        user = User.find_by(id: params[:id])
        if user
          user.destroy
          head :no_content
        else
          render json: { error: "User not found" }, status: :not_found
        end
      end
end
