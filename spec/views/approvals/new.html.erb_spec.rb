require 'rails_helper'

RSpec.describe "approvals/new", type: :view do
  before(:each) do
    assign(:approval, Approval.new(
      :course_id => 1,
      :employee_id => "MyString",
      :role => "MyString",
      :response => "MyString",
      :deny_reason => "MyText",
      :course => nil
    ))
  end

  it "renders new approval form" do
    render

    assert_select "form[action=?][method=?]", approvals_path, "post" do

      assert_select "input[name=?]", "approval[course_id]"

      assert_select "input[name=?]", "approval[employee_id]"

      assert_select "input[name=?]", "approval[role]"

      assert_select "input[name=?]", "approval[response]"

      assert_select "textarea[name=?]", "approval[deny_reason]"

      assert_select "input[name=?]", "approval[course_id]"
    end
  end
end
