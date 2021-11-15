require 'rails_helper'

RSpec.describe "reimbursements/new", type: :view do
  before(:each) do
    assign(:reimbursement, Reimbursement.new(
      course: nil,
      user: nil,
      payee: "",
      created_by: "",
      reviewed_by: "",
      grade_met: false,
      credits_approved: 1,
      amount: "",
      status: 1
    ))
  end

  it "renders new reimbursement form" do
    render

    assert_select "form[action=?][method=?]", reimbursements_path, "post" do

      assert_select "input[name=?]", "reimbursement[course_id]"

      assert_select "input[name=?]", "reimbursement[user_id]"

      assert_select "input[name=?]", "reimbursement[payee]"

      assert_select "input[name=?]", "reimbursement[created_by]"

      assert_select "input[name=?]", "reimbursement[reviewed_by]"

      assert_select "input[name=?]", "reimbursement[grade_met]"

      assert_select "input[name=?]", "reimbursement[credits_approved]"

      assert_select "input[name=?]", "reimbursement[amount]"

      assert_select "input[name=?]", "reimbursement[status]"
    end
  end
end
