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

  describe "new category" do
    before do
        visit categories_path
        click_link "Agregar Categoría"
    end

    it "Should appear the text 'Agregar una categoría'" do
        expect(page).to have_content "Agregar una categoría"
    end
  end

  describe "Create category" do
    context "With valid data" do
        before do
            visit new_category_path
            fill_in "category_name", :with=>"Categoría dada de alta con spec"
            click_button "Guardar"
        end

        it "Checking if the record saves" do
            expect(page).to have_content "Registro Guardado Satisfactoriamente"
        end
    end

    context "With invalid data" do
        before do
            visit new_category_path
            click_button "Guardar"
        end

        it "Showing error without name" do
            expect(page).to have_content "Name can't be blank"
        end
    end
  end

  describe "Delete a category" do
    let!(:category) {category.first}
    before do
        visit categories_path
        find_by_id('del'+category.id.to_s).click
    end

    it "Showing confirmation of error" do
        expect(page).to have_content "La categoría fue eliminado correctamente."
    end
  end


end
