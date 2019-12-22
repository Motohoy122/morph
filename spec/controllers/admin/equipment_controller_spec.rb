require 'rails_helper'

RSpec.describe Admin::EquipmentController, type: :controller do
 describe "equipment#new action" do
    it "should require the user is a user and logged in" do
      get :new
      expect(response).to redirect_to new_user_session_path

    end

    it "should successfully show the new form to create a equipment" do
      user = FactoryBot.create(:user)
      sign_in user

      get :new
      expect(response).to have_http_status(:success)
    end
  end

  describe "equipment#create action" do
    it "should successfully create a new equipment in our database" do
      user = FactoryBot.create(:user)
      sign_in user

      post :create, params: { equipment: { title: 'Test 1' } }

      equipment = Equipment.last
      expect(equipment.title).to eq('Test 1')
    end

    it "should properly deal with validation errors" do
      user = FactoryBot.create(:user)
      sign_in user

      post :create, params: { equipment: { title: '' } }
      expect(response).to have_http_status(:unprocessable_entity)
      expect(Equipment.count).to eq 0
    end
  end

  describe "equipments#edit action" do
    it "should require the user is a user and logged in" do
      user = FactoryBot.create(:user)
      sign_in user

    end
  end

  describe "equipment#edit action" do
    it "should successfully show the edit form if the equipment is found" do
      user = FactoryBot.create(:user)
      sign_in user
      equipment = FactoryBot.create(:equipment)
      get :edit, params: { id: equipment.id }
      expect(response).to have_http_status(:success)
    end

    it "should return a 404 error message if the equipment is not found" do
      user = FactoryBot.create(:user)
      sign_in user
      get :edit, params: { id: 'SWAG' }
      expect(response).to have_http_status(:not_found)
    end
  end

  describe "equipment#update action" do
    it "should allow users to successfully update equipments" do
      user = FactoryBot.create(:user)
      sign_in user
      equipment = FactoryBot.create(:equipment, title: "TestEquipment")
      patch :update, params: { id: equipment.id, equipment: { title: 'Changed' } }
      expect(response).to redirect_to root_path
      equipment.reload
      expect(equipment.title).to eq "Changed"

    end

    it "should render the edit form with an http status of unprocessable_entity" do
      user = FactoryBot.create(:user)
      sign_in user
      equipment = FactoryBot.create(:equipment, title: "Initial Value")
      patch :update, params: { id: equipment.id, equipment: { title: '' } }
      expect(response).to have_http_status(:unprocessable_entity)
      equipment.reload
      expect(equipment.title).to eq "Initial Value"

    end
  end

  describe "equipment#destroy action" do
    it "should allow a user to destroy equipment" do
      user = FactoryBot.create(:user)
      sign_in user
      equipment = FactoryBot.create(:equipment)
      delete :destroy, params: { id: equipment.id }
      expect(response).to redirect_to root_path
      equipment = Equipment.find_by_id(equipment.id)
      expect(equipment).to eq nil
    end

  end
end
