require 'rails_helper'

RSpec.describe Admin::TasksController, type: :controller do
 describe "tasks#new action" do
    it "should require the user is a user and logged in" do
      get :new
      expect(response).to redirect_to new_user_session_path

    end

    it "should successfully show the new form to create a task" do
      user = FactoryBot.create(:user)
      sign_in user

      get :new
      expect(response).to have_http_status(:success)
    end
  end

  describe "tasks#create action" do
    it "should successfully create a new task in our database" do
      user = FactoryBot.create(:user)
      sign_in user

      post :create, params: { task: { title: 'Test 1', description: 'TestTest' } }

      task = Task.last
      expect(task.title).to eq('Test 1')
    end

    it "should properly deal with validation errors" do
      user = FactoryBot.create(:user)
      sign_in user

      post :create, params: { task: { title: '' } }
      expect(response).to have_http_status(:unprocessable_entity)
      expect(Task.count).to eq 0
    end
  end

  describe "tasks#edit action" do
    it "should require the user is a user and logged in" do
      user = FactoryBot.create(:user)
      sign_in user

    end
 
    it "should successfully show the edit form if the task is found" do
      user = FactoryBot.create(:user)
      sign_in user
      task = FactoryBot.create(:task)
      get :edit, params: { id: task.id }
      expect(response).to have_http_status(:success)
    end

    it "should return a 404 error message if the task is not found" do
      user = FactoryBot.create(:user)
      sign_in user
      get :edit, params: { id: 'SWAG' }
      expect(response).to have_http_status(:not_found)
    end
  end

  describe "tasks#update action" do
    it "should allow users to successfully update tasks" do
      user = FactoryBot.create(:user)
      sign_in user
      task = FactoryBot.create(:task, title: "TestTask")
      patch :update, params: { id: task.id, task: { title: 'Changed' } }
      expect(response.body).to eq "updated!"
      task.reload
      expect(task.title).to eq "Changed"

    end

  end

  describe "tasks#destroy action" do
    it "should allow a user to destroy tasks" do
      user = FactoryBot.create(:user)
      sign_in user
      task = FactoryBot.create(:task)
      delete :destroy, params: { id: task.id }
      expect(response).to redirect_to root_path
      task = Task.find_by_id(task.id)
      expect(task).to eq nil
    end

  end
end
