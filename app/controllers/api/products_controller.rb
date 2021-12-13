module Api
  class ProductsController < ApplicationController

    def index
      @products = Product.all
      @products.each do |x|
        rails_blob_url(x.product_image)
      end
      render json: @products
    end

    def show
      @product = Product.find(params[:id])
      image = rails_blob_url(@product.product_image)
      render json: { "image": image, "data": @product }
    end

    def get_by_name
      @products = Product.where(name: params[:name]).order(created_at: desc)
      render json: @products
    end

    def create
      @product = Product.create(product_params)
      @product.save
      render json: @product
    end

    def update
      @product = Product.find(params[:id])
      @product.update(product_params)
      render json: @product
    end

    def destroy
      @product = Product.find(params[:id])
      @product.destroy
      render json: "ürün silindi"
    end

    def product_params
      params.permit(:name, :description, :quantity, :price, :product_image)
    end

  end
end
