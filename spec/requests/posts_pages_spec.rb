require 'rails_helper' 

RSpec.describe "PostsPages", type: :request do

  let!(:posts) {FactoryGirl.create_list(:post,5)}

  describe "Listing All Posts" do 
     before do
     	visit posts_path
     end

	context "Listing all posts" do 
		it "Should list all available post data" do 
			post.each do |post|
				expect(page).to have_content post.title
			end
		end
	end

  end

end
