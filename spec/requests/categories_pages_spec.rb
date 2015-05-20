require 'rails_helper'

RSpec.describe "CategoriesPosts", type: :request do
  let!(:categories) {FactoryGirl.create_list(:category,5)}

  describe "Listing All Categries" do 
     before do
     	visit categories_path
     	save_and_open_page
     end

	context "Listing all categories" do 
		it "Should list all available categories data" do 
			categories.each do |category|
				expect(page).to have_content category.name
			end
		end
	end

  end

end
