class CartsController < ApplicationController
    
    rescue_from ActiveRecord::RecordNotFound, with: :cart_not_found


    def show
        cart = Cart.find_by!(sess_id: params[:sess_id])
        products = cart.cart_items.map do |p|
            {
                item: Product.find(p.product_id),
                quantity: p.quantity,
            }
        end
        render json: products
    end

    private 

    def cart_not_found(exception)
        render json: {error: 'Cart not Found'}, status: :not_found
    end

end
