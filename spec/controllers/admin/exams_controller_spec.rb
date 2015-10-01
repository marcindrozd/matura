require 'rails_helper'

describe Admin::ExamsController do
  let(:admin_user) { create(:user, role: 'admin') }
  let(:exam) { create :exam }

  before { sign_in admin_user }

  describe '#index' do
    it 'renders page successfully' do
      get :index
      expect(response).to be_success
    end
  end

  describe '#edit' do
    it 'renders page successfully' do
      get :edit, id: exam.id
      expect(response).to be_success
    end
  end

  describe '#new' do
    it 'renders page successfully' do
      get :new
      expect(response).to be_success
    end
  end
end
