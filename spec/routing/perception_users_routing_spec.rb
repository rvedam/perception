require "rails_helper"

RSpec.describe PerceptionUsersController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/perception_users").to route_to("perception_users#index")
    end

    it "routes to #new" do
      expect(:get => "/perception_users/new").to route_to("perception_users#new")
    end

    it "routes to #show" do
      expect(:get => "/perception_users/1").to route_to("perception_users#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/perception_users/1/edit").to route_to("perception_users#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/perception_users").to route_to("perception_users#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/perception_users/1").to route_to("perception_users#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/perception_users/1").to route_to("perception_users#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/perception_users/1").to route_to("perception_users#destroy", :id => "1")
    end

  end
end
