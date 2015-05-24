require 'rails_helper'

RSpec.describe "PostsPages", type: :request do
  let!(:posts) {FactoryGirl.create_list(:post,5)}
  let!(:categories){FactoryGirl.create_list(:category,5)}
  describe "Listing All Posts" do
     before do
     	visit posts_path
     end

	context "Listing all posts" do
		it "Should list all available post data" do
			posts.each do |post|
				expect(page).to have_content post.title
                expect(page).to have_content post.body
                expect(page).to have_content post.publish_date
                expect(page).to have_content post.category.name
			end
		end
	end
  end


  describe "Visiting one post"do
    let!(:post) {posts.first}

    before do
        visit posts_path
        find_by_id('pos'+post.id.to_s).click
    end

    context "Correct Post" do
      it "should appear the title of the post" do
         expect(page).to have_content post.title
      end

      it "Should appear the body of the post" do
          expect(page).to have_content post.body
      end

      it "Should appear comments of the post" do
      end
    end

    context "Incorrect Post" do
      it "Error if post doesn't exist"
    end
  end

  describe "new post" do
    before do
        visit posts_path
        click_link "Agregar Post"
    end

    it "Should appear the text 'Nuevo Post'" do
        expect(page).to have_content "Agregar Post"
    end
  end



  describe "Create post" do
    let!(:category){categories.first}

    context "With valid data" do
        before do
            visit new_post_path
            fill_in "post_title", :with=>"Post dado de alta con el spec"
            fill_in "post_body", :with=>"Body del post dado de alta con el spec"
            select  category.name, :from => "post_category_id"

            click_button "Guardar"
        end

        it "Checking if the record saves" do
            expect(page).to have_content "Registro Guardado Satisfactoriamente"
        end
    end

    context "With invalid data" do
    end
  end



end
