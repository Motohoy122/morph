require 'rails_helper'

RSpec.describe Admin::ProjectsController, type: :controller do
  describe "projects#new action" do
    it "should require the user is a user and logged in" do
      get :new
      expect(response).to redirect_to new_user_session_path

    end

    it "should successfully show the new form to create a project" do
      user = FactoryBot.create(:user)
      sign_in user

      get :new
      expect(response).to have_http_status(:success)
    end
  end

  describe "projects#create action" do
    it "should successfully create a new project in our database" do
      user = FactoryBot.create(:user)
      sign_in user

      post :create, params: { project: { builder: 'Test 1' } }

      project = Project.last
      expect(project.builder).to eq('Test 1')
    end

    
  end

  describe "projects#edit action" do
    it "should require the user is a user and logged in" do
      user = FactoryBot.create(:user)
      sign_in user

    end
 
    it "should successfully show the edit form if the project is found" do
      user = FactoryBot.create(:user)
      sign_in user
      project = FactoryBot.create(:project)
      get :edit, params: { id: project.id }
      expect(response).to have_http_status(:success)
    end

    it "should return a 404 error message if the project is not found" do
      user = FactoryBot.create(:user)
      sign_in user
      get :edit, params: { id: 'SWAG' }
      expect(response).to have_http_status(:not_found)
    end
  end

  describe "projects#update action" do
    it "should allow users to successfully update projects" do
      user = FactoryBot.create(:user)
      sign_in user
      project = FactoryBot.create(:project, builder: "Testproject")
      patch :update, params: { id: project.id, project: { builder: 'Changed' } }
      expect(response).to redirect_to root_path
      project.reload
      expect(project.builder).to eq "Changed"

    end

  end

  describe "projects#destroy action" do
    it "should allow a user to destroy projects" do
      user = FactoryBot.create(:user)
      sign_in user
      project = FactoryBot.create(:project)
      delete :destroy, params: { id: project.id }
      expect(response).to redirect_to root_path
      project = Project.find_by_id(project.id)
      expect(project).to eq nil
    end

  end
end
