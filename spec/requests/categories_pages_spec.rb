require 'rails_helper'

RSpec.describe "CategoriesPosts", type: :request do
  let!(:categories) {FactoryGirl.create_list(:category,5)}

  describe "Listing All Categries" do
     before do
     	visit categories_path
     end

	   context "Listing all categories" do
       it "Should be title Listado de Categorías" do
        	expect(page).to have_content "Listado de Categorías"
       end

  		 it "Should list all available categories data" do
			    categories.each do |category|
				     expect(page).to have_content category.name
			    end
		   end
	   end
  end

  describe "Edit Category" do
    context "Correct Category" do
      let!(:category) {categories.first}

      before do
        visit categories_path
        find_by_id('ed'+category.id.to_s).click
      end

      it "should appear the text Editando" do
         expect(page).to have_content "Editando"
      end

      it "Should appear the name of the category" do
          expect(page).to have_content category.name
      end
    end

    context "Incorrect Category" do
      before do
        visit edit_category_path -1
      end

      it "Redirecting to Home Page" do
        expect(page).to have_content "Listado de Categorías"
      end

      it "Showing error message" do
        expect(page).to have_content "La categoría no existe"
      end
    end
  end

  describe " Update Category" do
    let!(:category) {categories.first}

    context "With valid data" do
      before do
        visit edit_category_path category.id
        fill_in "category_name", :with=>"Categoría de ejemplo"
        click_button "Guardar"
      end


      it "Checking if the record saves " do
        expect(page).to have_content "Registro Guardado Satisfactoriamente"
      end
        end

    context "With Invalid data" do
      before do
        visit edit_category_path category.id
        fill_in "category_name", :with=>""
        click_button "Guardar"
      end


      it "Showing error without name" do
        expect(page).to have_content "Name can't be blank"
      end
    end
  end
end
