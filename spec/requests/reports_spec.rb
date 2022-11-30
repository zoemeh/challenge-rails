require 'rails_helper'
require 'external/client'

RSpec.describe "Reports", type: :request do

  let(:valid_profile) {
    {
      "username": "eat-test",
      "repositories_attributes": [
          {
          "name": "balance-mocha-6",
          "tags": "test,swift,mysql"
          }
          
      ]
    }
  }
  describe "GET /index" do
    it "returns http success" do
      get "/reports"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /index.json" do
    it "returns http success" do
      get "/reports.json"
      expect(response).to have_http_status(:success)
      expect(JSON.parse(response.body)).to eq (
        Profile.includes(:repositories).all.as_json
      )
    end
  end

  describe "GET /reports?tag=test" do
    it "returns http success" do
      profile = Profile.create! valid_profile
      get "/reports.json?tag=test"
      expect(response).to have_http_status(:success)
      expect(JSON.parse(response.body).first["username"]).to eq(
        profile.username
      )
    end
  end

  describe "GET /external" do
    let!(:external_client) { instance_double(External::Client) }

    before do
      allow(external_client).to receive(:fetch_profiles).and_return([
        {
          "id": 1,
          "username": "eat-music-4",
          "superuser": false
        },
        {
          "id": 2,
          "username": "leopard-7",
          "superuser": false
        }])
      allow(external_client).to receive(:fetch_repositories).and_return([
        {
          "id": 1,
          "name": "balance-mocha-6",
          "tags": "linux,swift,mysql",
          "profile_id": 1
        },
        {
          "id": 2,
          "name": "drink-owl-8",
          "tags": "bsd,python,postgresql",
          "profile_id": 14
        }])
      allow(External::Client).to receive(:new).and_return(external_client)
    end

    it 'should get external information' do
      expect(external_client).to receive(:fetch_profiles)
      expect(external_client).to receive(:fetch_repositories)
      get "/reports/external"
      expect(response).to have_http_status(:success)

    end
  end
end
