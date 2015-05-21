class CategoriesController < ApplicationController
	def index
		@categories = Category.all
	end

    def edit
    end
end
