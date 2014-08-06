require 'rails_helper'

RSpec.describe SearchController, :type => :controller do

  describe "GET get_instruments_for_group" do
    it "returns http success" do
      get :get_instruments_for_group
      expect(response).to be_success
    end
  end

end
