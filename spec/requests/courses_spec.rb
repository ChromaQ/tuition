require 'rails_helper'

RSpec.describe "Courses", type: :request do
  setup do
    @employee = FactoryBot.create(:employee)
    @course = FactoryBot.create(:course)
    @course.employee = @employee
  end

  describe "GET /courses" do
    it "works! (now write some real specs)" do
      get courses_path
      expect(response).to redirect_to(root_path)
    end
  end
end
