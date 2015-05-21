class CategoriesController < ApplicationController
    before_action :set_category, only: [:edit, :update, :destroy]

	def index
		@categories = Category.all
	end

    def edit
    end


    private

    def set_category
        @category = Category.find(params[:id])

    rescue ActiveRecord::RecordNotFound
        flash[:error] = "La categoría no existe"
        redirect_to categories_path
    end
end
