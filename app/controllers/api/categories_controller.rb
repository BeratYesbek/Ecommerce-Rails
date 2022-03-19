module Api
  class CategoriesController < ApplicationController

    before_action :authenticate_user!
    before_action -> {check_user_roles(Security::RoleModule.only_admin_and_superadmin)}, only: %i[update create destroy]
    before_action -> {check_user_roles(Security::RoleModule.all_roles)}

    before_action :read_cache, only: %i[index show]
    before_action :set_category, only: %i[update show destroy]

    after_action -> {write_cache(@product)},only: %i[index show], if: -> {@is_cached == false}
    after_action -> {remove_cache  },only: %i[create update destroy]

    after_action :log_file
    after_action :log_database

    def index
      @categories = Category.order(created_at: :desc)
      byebug
      if !@categories.blank?
        render json: @categories, status: :ok
      else
        render json: @categories, status: :bad_request
      end
    end

    def show
      if !@category.blank?
        render json: @category, status: :ok
      else
        render json: @category, status: :bad_request
      end
    end

    def create

      @category = Category.create(params_category)
      if @category.save
        render json: @category, status: :ok
      else
        render json: "Category kaydedilemedi", status: :bad_request
      end
    end

    def update
      byebug 
      if @category.update(params_category)
        render json: @category, status: :ok
      else
        render json: "category güncellenemedi", status: :bad_request
      end
    end

    def destroy
      if @category.destroy
        render json: "Category silindi", status: :ok
      else
        render json: "category silinemedi", status: :bad_request
      end
    end

    private

    def set_category
      @category = Category.find(params[:id])
    end

    def params_category
      params.permit(:name)
    end
  end
end