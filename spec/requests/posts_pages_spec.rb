require 'rails_helper'

RSpec.describe "PostsPages", type: :request do
  let!(:posts) {FactoryGirl.create_list(:post,5)}
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
    end

    context "Incorrect Post" do
    end

  end

end
