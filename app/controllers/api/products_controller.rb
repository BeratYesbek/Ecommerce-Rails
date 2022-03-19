module Api
  class ProductsController < ApplicationController



    def index
      @product = Product.all
      authorize(@products)
      if !@product.blank? 
        @message = "Ürünler listelendi."
        render :index, status: :ok
      else
        @message = "Ürün yok"
        handler_error
      end
    end

    def show
      authorize(@product)
      if !@product.present?
        render :show, status: :ok
      else
        handler_error
      end
    end

    def get_by_name
      @products = Product.where(name: params[:name]).order(created_at: :desc)
      if !@products.blank?
        render 'index.json.jbuilder', status: :ok
      else
        @message = "İsime göre ürün bulunamadı!"
        handler_error
      end
    end

    def create
      @product = Product.create(product_params)
      #authorize(@product)
      if @product.valid?
        @product.save
        render :create, status: :ok
      else
        @message = @product.errors.full_messages
        handler_error
      end

    end

    def update
      authorize(@product)
      if @product.update(product_params)
        @message = "Başarıyla Güncellendi."
        render :update, status: :ok
      else
        @message = "Güncellenemedi"
        handler_error
      end
    end

    def destroy
      #authorize(@product)
      if @product.destroy
        render :destroy, status: :ok
      else
        @message = "Silinirken bir hata oluştu"
        handler_error
      end
    end

    private

    def handler_error
      render :error, status: :bad_request
    end

    def set_product
      @product = Product.find(params[:id])
      print "set product before action methodu çalıştı"
    end

    def after_action_method
      print "after action method"
    end

    def product_params
      params.permit(:name, :description, :quantity, :price, :product_image, :category_id)
    end

  end
end
