require "rails_helper"

RSpec.describe MyTransactionsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/my_transactions").to route_to("my_transactions#index")
    end

    it "routes to #new" do
      expect(get: "/my_transactions/new").to route_to("my_transactions#new")
    end

    it "routes to #show" do
      expect(get: "/my_transactions/1").to route_to("my_transactions#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/my_transactions/1/edit").to route_to("my_transactions#edit", id: "1")
    end


    it "routes to #create" do
      expect(post: "/my_transactions").to route_to("my_transactions#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/my_transactions/1").to route_to("my_transactions#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/my_transactions/1").to route_to("my_transactions#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/my_transactions/1").to route_to("my_transactions#destroy", id: "1")
    end
  end
end
