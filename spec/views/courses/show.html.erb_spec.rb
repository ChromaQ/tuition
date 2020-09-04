require 'rails_helper'

RSpec.describe "courses/show", type: :view do
  before(:each) do
    @course = assign(:course, Course.create!(
      :employee_id => "Employee",
      :course_title => "Course Title",
      :course_short => "Course Short",
      :credit_hours => 2,
      :cost => 3.5
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Employee/)
    expect(rendered).to match(/Course Title/)
    expect(rendered).to match(/Course Short/)
    expect(rendered).to match(/2/)
    expect(rendered).to match(/3.5/)
  end
end
