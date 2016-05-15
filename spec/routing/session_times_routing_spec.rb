require "rails_helper"

RSpec.describe SessionTimesController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/session_times").to route_to("session_times#index")
    end

    it "routes to #new" do
      expect(:get => "/session_times/new").to route_to("session_times#new")
    end

    it "routes to #show" do
      expect(:get => "/session_times/1").to route_to("session_times#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/session_times/1/edit").to route_to("session_times#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/session_times").to route_to("session_times#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/session_times/1").to route_to("session_times#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/session_times/1").to route_to("session_times#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/session_times/1").to route_to("session_times#destroy", :id => "1")
    end

  end
end
