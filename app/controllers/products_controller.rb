class ProductsController < ApplicationController

    protect_from_forgery

    def index
        products = Product.all 
        render json: products
    end

    def create 
        product = Product.create!(product_params)
        render json: product, status: :created
    end

    private

    def product_params
        params.require(:product).permit(:name, :description, :price, :box_count)
    end

end
