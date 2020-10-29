require 'rails_helper'

RSpec.describe "approvals/show", type: :view do
  before(:each) do
    @approval = assign(:approval, Approval.create!(
      :course_id => 2,
      :employee_id => "Employee",
      :role => "Role",
      :response => "Response",
      :deny_reason => "MyText",
      :course => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/2/)
    expect(rendered).to match(/Employee/)
    expect(rendered).to match(/Role/)
    expect(rendered).to match(/Response/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(//)
  end
end
