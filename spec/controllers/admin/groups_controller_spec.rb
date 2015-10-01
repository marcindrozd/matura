require 'rails_helper'

describe Admin::GroupsController do
  let(:admin_user) { create(:user, role: 'admin') }
  let(:exam) { create :exam }
  let(:group) { create :group, exam: exam }

  before { sign_in admin_user }

  describe '#index' do
    it 'renders page successfully' do
      get :index, exam_id: exam.id
      expect(response).to be_success
    end
  end

  describe '#edit' do
    it 'renders page successfully' do
      get :edit, exam_id: exam.id, id: group.id
      expect(response).to be_success
    end
  end

  describe '#new' do
    it 'renders page successfully' do
      get :new, exam_id: exam.id
      expect(response).to be_success
    end
  end
end
