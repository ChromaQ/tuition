require 'rails_helper'

RSpec.describe "courses/new", type: :view do
  before(:each) do
    assign(:course, Course.new(
      :employee_id => "MyString",
      :course_title => "MyString",
      :course_short => "MyString",
      :credit_hours => 1,
      :cost => 1.5
    ))
  end

  it "renders new course form" do
    render

    assert_select "form[action=?][method=?]", courses_path, "post" do

      assert_select "input[name=?]", "course[employee_id]"

      assert_select "input[name=?]", "course[course_title]"

      assert_select "input[name=?]", "course[course_short]"

      assert_select "input[name=?]", "course[credit_hours]"

      assert_select "input[name=?]", "course[cost]"
    end
  end
end
