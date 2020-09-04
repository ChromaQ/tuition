require 'rails_helper'

RSpec.describe "courses/edit", type: :view do
  before(:each) do
    @course = assign(:course, Course.create!(
      :employee_id => "MyString",
      :course_title => "MyString",
      :course_short => "MyString",
      :credit_hours => 1,
      :cost => 1.5
    ))
  end

  it "renders the edit course form" do
    render

    assert_select "form[action=?][method=?]", course_path(@course), "post" do

      assert_select "input[name=?]", "course[employee_id]"

      assert_select "input[name=?]", "course[course_title]"

      assert_select "input[name=?]", "course[course_short]"

      assert_select "input[name=?]", "course[credit_hours]"

      assert_select "input[name=?]", "course[cost]"
    end
  end
end
