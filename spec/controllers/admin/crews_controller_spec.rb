require 'rails_helper'

RSpec.describe Admin::CrewsController, type: :controller do
  describe "crews#new action" do
    it "should require the user is a user and logged in" do
      get :new
      expect(response).to redirect_to new_user_session_path

    end

    it "should successfully show the new form to create a crew" do
      user = FactoryBot.create(:user)
      sign_in user

      get :new
      expect(response).to have_http_status(:success)
    end
  end

  describe "crews#create action" do
    it "should successfully create a new crew in our database" do
      user = FactoryBot.create(:user)
      sign_in user

      post :create, params: { crew: { title: 'Test 1' } }

      crew = Crew.last
      expect(crew.title).to eq('Test 1')
    end

    it "should properly deal with validation errors" do
      user = FactoryBot.create(:user)
      sign_in user

      post :create, params: { crew: { title: '' } }
      expect(response).to have_http_status(:unprocessable_entity)
      expect(Crew.count).to eq 0
    end
  end

  describe "crews#edit action" do
    it "should require the user is a user and logged in" do
      user = FactoryBot.create(:user)
      sign_in user

    end
  end

  describe "crews#edit action" do
    it "should successfully show the edit form if the crew is found" do
      user = FactoryBot.create(:user)
      sign_in user
      crew = FactoryBot.create(:crew)
      get :edit, params: { id: crew.id }
      expect(response).to have_http_status(:success)
    end

    it "should return a 404 error message if the crew is not found" do
      user = FactoryBot.create(:user)
      sign_in user
      get :edit, params: { id: 'SWAG' }
      expect(response).to have_http_status(:not_found)
    end
  end

  describe "crews#update action" do
    it "should allow users to successfully update crews" do
      user = FactoryBot.create(:user)
      sign_in user
      crew = FactoryBot.create(:crew, title: "TestCrew")
      patch :update, params: { id: crew.id, crew: { title: 'Changed' } }
      expect(response).to redirect_to root_path
      crew.reload
      expect(crew.title).to eq "Changed"

    end

    it "should render the edit form with an http status of unprocessable_entity" do
      user = FactoryBot.create(:user)
      sign_in user
      crew = FactoryBot.create(:crew, title: "Initial Value")
      patch :update, params: { id: crew.id, crew: { title: '' } }
      expect(response).to have_http_status(:unprocessable_entity)
      crew.reload
      expect(crew.title).to eq "Initial Value"

    end
  end

  describe "crews#destroy action" do
    it "should allow a user to destroy crews" do
      user = FactoryBot.create(:user)
      sign_in user
      crew = FactoryBot.create(:crew)
      delete :destroy, params: { id: crew.id }
      expect(response).to redirect_to root_path
      crew = Crew.find_by_id(crew.id)
      expect(crew).to eq nil
    end

  end

end
