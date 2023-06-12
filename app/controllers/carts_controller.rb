class CartsController < ApplicationController
    
    rescue_from ActiveRecord::RecordNotFound, with: :cart_not_found


    def show
        cart = Cart.find_by!(sess_id: params[:sess_id])
        products = cart.cart_items.map do |p|
            {
                item: Product.find(p.product_id),
                quantity: p.quantity,
                cart_item: p.id
            }
        end
        render json: products
    end

    def destroy
        cart = Cart.find_by!(sess_id: params[:sess_id])
        cart.destroy
        head :no_content
    end

    private 

    def cart_not_found(exception)
        render json: {error: 'Cart not Found'}, status: :not_found
    end

end
