class CategoriesController < ApplicationController
    before_action :set_category, only: [:edit, :update, :destroy]

	def index
		@categories = Category.all
	end

    def edit
    end

    def update

      respond_to do |format|

          if @category.update(category_params)
            format.html { redirect_to categories_path, notice: 'Registro Guardado Satisfactoriamente' }
            format.json { render :index, status: :ok, location: @category }
          else
            format.html { render :edit}
            format.json { render json: @category.errors, status: :unprocessable_entity }
          end
      end

    end

    def new
        @category = Category.new
    end

    def create
        @category = Category.new(category_params)

        respond_to do |format|
          if @category.save
            format.html { redirect_to categories_path, notice: 'Registro Guardado Satisfactoriamente' }
            format.json { render :index, status: :created, location: @category }
          else
            format.html { render :new }
            format.json { render json: @category.errors, status: :unprocessable_entity }
          end
        end
    end

    def destroy
       @category.destroy
       respond_to do |format|
          format.html { redirect_to categories_path, notice: 'La categoría fue eliminado correctamente.' }
          format.json { head :no_content }
       end
    end


    private
    def category_params
      params.require(:category).permit(:name)
    end

    def set_category
        @category = Category.find(params[:id])

    rescue ActiveRecord::RecordNotFound
        flash[:error] = "La categoría no existe"
        redirect_to categories_path
    end
end
