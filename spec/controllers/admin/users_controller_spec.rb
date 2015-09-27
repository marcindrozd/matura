require 'rails_helper'

describe Admin::UsersController do
  let(:admin_user) { create(:user, role: 'admin') }

  before { sign_in admin_user }

  describe '#index' do
    it 'renders page successfully' do
      get :index
      expect(response).to be_success
    end
  end
end
