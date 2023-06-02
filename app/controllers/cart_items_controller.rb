class CartItemsController < ApplicationController

    protect_from_forgery

    def create 
        if Cart.find_by(sess_id: params[:sess_id])
            cart = Cart.find_by(sess_id: params[:sess_id])
        else 
            cart = Cart.create!(sess_id: params[:sess_id])
        end
        if cart.cart_items.where(product_id: params[:product_id]) == []
            CartItem.create!(cart_id: cart.id, quantity: params[:quantity], product_id: params[:product_id])
        else
            c_i = cart.cart_items.find_by!(product_id: params[:product_id])
            c_i.update(quantity: c_i.quantity += params[:quantity].to_i)
        end
        render json: cart.cart_items, status: :created
    end

    def destroy
        cart_item = CartItem.find(params[:id])
        cart_item.destroy 
        head :no_content
    end

end
