require "rails_helper"

describe Admin::ExamsController do
  let(:admin_user) { create(:user, role: "admin") }
  let(:exam) { create :exam }

  before { sign_in admin_user }

  describe "#index" do
    it "renders page successfully" do
      get :index

      expect(assigns(:exams)).to eq([exam])
      expect(response).to be_success
    end
  end

  describe '#edit' do
    it "renders page successfully" do
      get :edit, params: { id: exam.id }

      expect(assigns(:exam)).to eq(exam)
      expect(response).to be_success
    end
  end

  describe "#new" do
    it "renders page successfully" do
      get :new

      expect(assigns(:exam)).to be_instance_of(Exam)
      expect(response).to be_success
    end
  end
end
