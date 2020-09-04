require 'rails_helper'

RSpec.describe "courses/index", type: :view do
  before(:each) do
    assign(:courses, [
      Course.create!(
        :employee_id => "Employee",
        :course_title => "Course Title",
        :course_short => "Course Short",
        :credit_hours => 2,
        :cost => 3.5
      ),
      Course.create!(
        :employee_id => "Employee",
        :course_title => "Course Title",
        :course_short => "Course Short",
        :credit_hours => 2,
        :cost => 3.5
      )
    ])
  end

  it "renders a list of courses" do
    render
    assert_select "tr>td", :text => "Employee".to_s, :count => 2
    assert_select "tr>td", :text => "Course Title".to_s, :count => 2
    assert_select "tr>td", :text => "Course Short".to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => 3.5.to_s, :count => 2
  end
end
