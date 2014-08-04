require "rails_helper"

RSpec.describe PiecesController, :type => :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/pieces").to route_to("pieces#index")
    end

    it "routes to #new" do
      expect(:get => "/pieces/new").to route_to("pieces#new")
    end

    it "routes to #show" do
      expect(:get => "/pieces/1").to route_to("pieces#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/pieces/1/edit").to route_to("pieces#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/pieces").to route_to("pieces#create")
    end

    it "routes to #update" do
      expect(:put => "/pieces/1").to route_to("pieces#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/pieces/1").to route_to("pieces#destroy", :id => "1")
    end

  end
end
