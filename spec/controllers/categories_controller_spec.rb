require 'rails_helper'

RSpec.describe CategoriesController, type: :controller do
   describe "edit" do
      before do
        get :edit, :id=>-1
      end

      it "Redirecting to the Home Page" do
         expect(response).to redirect_to(categories_path)
      end

      it "Showing the error message" do
          expect(flash[:error]).to eql("La categoría no existe")
      end
   end

end
