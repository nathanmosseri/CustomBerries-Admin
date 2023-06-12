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
        if cart_item.cart.cart_items.count <= 1
            cart_item.cart.destroy
        else
            cart_item.destroy 
        end
        head :no_content
    end

end
