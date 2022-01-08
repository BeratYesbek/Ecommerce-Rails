module Api
  class ProductsController < ApplicationController

    before_action :set_product, only: %i[update show destroy]
    after_action :after_action_method, only: %i[create]

    def index
      @products = Product.all
      if !@products.blank?
        @message = "Ürünler listelendi."
        render :index, status: :ok
      else
        @message = "Ürün yok"
        render :error, status: :bad_request
      end
    end

    def show
      #image = rails_blob_url(@product.product_image)
      render json: { "data": { product: @product, category: @product.category } }
    end

    def get_by_name
      @products = Product.where(name: params[:name]).order(created_at: desc)
      render json: @products
    end

    def create
      @product = Product.create(product_params)
      if @product.valid?
        @product.save
        render :create, status: :ok
      else
        @message = @product.errors.full_messages
        render :error, status: :bad_request
      end

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
    end

    def after_action_method
      print "after action method"
    end

    def product_params
      params.permit(:name, :description, :quantity, :price, :product_image,:category_id)
    end

  end
end
