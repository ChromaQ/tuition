require 'rails_helper'

RSpec.describe "reimbursements/index", type: :view do
  before(:each) do
    assign(:reimbursements, [
      Reimbursement.create!(
        course: nil,
        user: nil,
        payee: "",
        created_by: "",
        reviewed_by: "",
        grade_met: false,
        credits_approved: 2,
        amount: "",
        status: 3
      ),
      Reimbursement.create!(
        course: nil,
        user: nil,
        payee: "",
        created_by: "",
        reviewed_by: "",
        grade_met: false,
        credits_approved: 2,
        amount: "",
        status: 3
      )
    ])
  end

  it "renders a list of reimbursements" do
    render
    assert_select "tr>td", text: nil.to_s, count: 2
    assert_select "tr>td", text: nil.to_s, count: 2
    assert_select "tr>td", text: "".to_s, count: 2
    assert_select "tr>td", text: "".to_s, count: 2
    assert_select "tr>td", text: "".to_s, count: 2
    assert_select "tr>td", text: false.to_s, count: 2
    assert_select "tr>td", text: 2.to_s, count: 2
    assert_select "tr>td", text: "".to_s, count: 2
    assert_select "tr>td", text: 3.to_s, count: 2
  end
end
