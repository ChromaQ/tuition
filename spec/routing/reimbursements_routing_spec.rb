require "rails_helper"

RSpec.describe ReimbursementsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/reimbursements").to route_to("reimbursements#index")
    end

    it "routes to #new" do
      expect(get: "/reimbursements/new").to route_to("reimbursements#new")
    end

    it "routes to #show" do
      expect(get: "/reimbursements/1").to route_to("reimbursements#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/reimbursements/1/edit").to route_to("reimbursements#edit", id: "1")
    end


    it "routes to #create" do
      expect(post: "/reimbursements").to route_to("reimbursements#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/reimbursements/1").to route_to("reimbursements#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/reimbursements/1").to route_to("reimbursements#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/reimbursements/1").to route_to("reimbursements#destroy", id: "1")
    end
  end
end
