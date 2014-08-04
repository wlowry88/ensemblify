require 'rails_helper'

RSpec.describe "Pieces", :type => :request do
  describe "GET /pieces" do
    it "works! (now write some real specs)" do
      get pieces_path
      expect(response.status).to be(200)
    end
  end
end
