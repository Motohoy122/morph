require 'rails_helper'

RSpec.describe ProjectsController, type: :controller do

  describe "projects#index action" do
    it "should successfully show the page" do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

  describe "projects#show action" do
    it "should successfully show the page if the project is found" do
      project = FactoryBot.create(:project)
      get :show, params: { id: project.id }
      expect(response).to have_http_status(:success)
    end

    it "should return a 404 error if the project is not found" do
      get :show, params: { id: 'TACOCAT' }
      expect(response).to have_http_status(:not_found)
    end
  end
end
