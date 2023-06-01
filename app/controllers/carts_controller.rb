class CartsController < ApplicationController

rescue_from ActiveRecord::RecordNotFound, with: :cart_not_found

    def show
        cart = Cart.find_by!(sess_id: params[:sess_id])
        render json: cart.cart_items
    end

    private 

    def cart_not_found
        render json: {error: 'Cart not Found'}
    end

end
