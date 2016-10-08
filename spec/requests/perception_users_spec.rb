require 'rails_helper'

RSpec.describe "PerceptionUsers", type: :request do
  describe "GET /perception_users" do
    it "works! (now write some real specs)" do
      get perception_users_path
      expect(response).to have_http_status(200)
    end
  end
end
