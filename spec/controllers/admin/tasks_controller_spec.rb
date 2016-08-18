require 'rails_helper'

describe Admin::TasksController do
  let(:admin_user) { create(:user, role: 'admin') }
  let(:exam) { create :exam }
  let(:task) { create :task, exam: exam }

  before { sign_in admin_user }

  describe '#index' do
    it 'renders page successfully' do
      get :index, params: { exam_id: exam.id }

      expect(assigns(:tasks)).to match_array([task])
      expect(response).to be_success
    end
  end

  describe '#edit' do
    it 'renders page successfully' do
      get :edit, params: { id: task.id }

      expect(assigns(:task)).to eq(task)
      expect(response).to be_success
    end
  end

  describe '#new' do
    it 'renders page successfully' do
      get :new, params: { exam_id: exam.id }

      expect(assigns(:task)).to be_instance_of(Task)
      expect(response).to be_success
    end
  end
end
