require "rails_helper"

RSpec.describe DegreesController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(:get => "/degrees").to route_to("degrees#index")
    end

    it "routes to #new" do
      expect(:get => "/degrees/new").to route_to("degrees#new")
    end

    it "routes to #show" do
      expect(:get => "/degrees/1").to route_to("degrees#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/degrees/1/edit").to route_to("degrees#edit", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/degrees").to route_to("degrees#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/degrees/1").to route_to("degrees#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/degrees/1").to route_to("degrees#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/degrees/1").to route_to("degrees#destroy", :id => "1")
    end
  end
end
