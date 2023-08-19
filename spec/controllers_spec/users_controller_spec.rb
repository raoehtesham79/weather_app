require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  describe "GET #new" do
    it "assigns a new User to @user" do
      get :new
      expect(controller.instance_variable_get(:@user)).to be_instance_of(User).and be_new_record
    end
  end
  describe "POST #authenticate" do
    let(:user) { User.create(email: "test@example.com", password: "password") }

    context "with valid credentials" do
      it "logs in the user and redirects to root_path with a notice" do
        post :authenticate, params: { email: user.email, password: "password" }
        expect(session[:user_id]).to eq(user.id)
        expect(response).to redirect_to(root_path)
        expect(flash[:notice]).to eq("Logged in successfully.")
      end
    end

    context "with invalid credentials" do
      it "renders the login template with an alert" do
        post :authenticate, params: { email: user.email, password: "wrong_password" }
        expect(session[:user_id]).to be_nil
        expect(flash.now[:alert]).to eq("Invalid email or password.")
      end
    end
  end
  describe '#create' do
    context 'with valid parameters and a new user' do
      it 'creates a new user and redirects to weather_index_path' do
        post :create, params: { user: { email: 'test@example.com', password: 'password', password_confirmation: 'password' } }
        expect(response).to redirect_to(weather_index_path)
        expect(session[:user_id]).to eq(User.last.id)
      end
    end

    context 'with an existing user email' do
      it 'renders the :new template with an alert' do
        existing_user = User.create(email: 'test@example.com', password: 'existing_password', password_confirmation: 'existing_password')
        post :create, params: { user: { email: existing_user.email, password: 'password', password_confirmation: 'password' } }
        expect(flash[:alert]).to eq('This Email Already Exists')
      end
    end
  end
end
