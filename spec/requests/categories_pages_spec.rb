require 'rails_helper'

RSpec.describe "CategoriesPosts", type: :request do
  let!(:categories) {FactoryGirl.create_list(:category,5)}

  describe "Listing All Categries" do
     before do
     	visit categories_path
      save_and_open_page
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
  end
end
