module Api
  class ProductsController < ApplicationController

    before_action :set_product, only: %i[update show destroy]
    after_action :after_action_method, only: %i[create]
    def index
      @products = Product.all
      @products.each do |x|
        rails_blob_url(x.product_image)
      end
      render json: @products
    end

    def show
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
      @product.update(product_params)
      render json: @product
    end

    def destroy
      @product.destroy
      render json: "ürün silindi"
    end

    def set_product
      @product = Product.find(params[:id])
      print "set product before action methodu çalıştı"
      byebug
    end

    def after_action_method
      print "after action method"
      byebug
    end

    def product_params
      params.permit(:name, :description, :quantity, :price, :product_image)
    end

  end
end
