require 'rails_helper'

RSpec.describe "CategoriesPosts", type: :request do
  describe "GET /categories_posts" do
    it "works! (now write some real specs)" do
      get categories_posts_path
      expect(response).to have_http_status(200)
    end
  end
end
