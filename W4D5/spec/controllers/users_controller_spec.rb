require 'rails_helper'

begin
  UsersController
rescue
  UsersController = nil
end

RSpec.describe UsersController, type: :controller do
  describe "GET #new" do
    it "renders the registration page" do
      get :new, user: {}

      expect(response).to render_template("new")
      expect(response).to have_http_status(200)
    end
  end

  describe "POST #create" do

    context "with invalid params" do
      it "renders the registration page" do
        post :create, user: { user_name: "yungthug4" }

        expect(response).to render_template(:new)
        expect(flash[:errors]).to be_present
      end
    end

    context "with valid params" do
      it "redirects to User profile" do
        post :create, user: { user_name: 'yungthug4', password: 'password' }
        
        expect(response).to render_template(:show, {id: User.last.id})
        expect(response).to have_http_status(200)
      end
    end
  end

  describe "GET #show/:id" do
    it "renders the registration page" do
      User.create!(user_name: "yungthug4", password: "password")
      get :show, id: 1
      expect(response).to render_template(:show)
    end

    context 'if the user does not exist' do
      it 'is not a success' do
        begin
          get :show, id: -1
        rescue
          ActiveRecord::RecordNotFound
        end

        expect(response).not_to render_template(:show)
      end
    end
  end
end
