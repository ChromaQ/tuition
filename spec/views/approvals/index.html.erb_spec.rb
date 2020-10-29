require 'rails_helper'

RSpec.describe "approvals/index", type: :view do
  before(:each) do
    assign(:approvals, [
      Approval.create!(
        :course_id => 2,
        :employee_id => "Employee",
        :role => "Role",
        :response => "Response",
        :deny_reason => "MyText",
        :course => nil
      ),
      Approval.create!(
        :course_id => 2,
        :employee_id => "Employee",
        :role => "Role",
        :response => "Response",
        :deny_reason => "MyText",
        :course => nil
      )
    ])
  end

  it "renders a list of approvals" do
    render
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => "Employee".to_s, :count => 2
    assert_select "tr>td", :text => "Role".to_s, :count => 2
    assert_select "tr>td", :text => "Response".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
