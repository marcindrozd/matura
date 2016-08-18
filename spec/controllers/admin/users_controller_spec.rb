require 'rails_helper'

describe Admin::UsersController do
  let(:admin_user) { create(:user, role: 'admin') }
  let(:user) { create :user }

  before { sign_in admin_user }

  describe '#index' do
    it 'renders page successfully' do
      get :index

      expect(assigns(:users)).to match_array([admin_user, user])
      expect(response).to be_success
    end
  end

  describe '#edit' do
    it 'renders page successfully' do
      get :edit, params: { id: user.id }

      expect(assigns(:user)).to eq(user)
      expect(response).to be_success
    end
  end

  describe '#new' do
    it 'renders page successfully' do
      get :new

      expect(assigns(:user)).to be_instance_of(User)
      expect(response).to be_success
    end
  end
end
