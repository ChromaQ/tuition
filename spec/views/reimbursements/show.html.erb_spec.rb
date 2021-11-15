require 'rails_helper'

RSpec.describe "reimbursements/show", type: :view do
  before(:each) do
    @reimbursement = assign(:reimbursement, Reimbursement.create!(
      course: nil,
      user: nil,
      payee: "",
      created_by: "",
      reviewed_by: "",
      grade_met: false,
      credits_approved: 2,
      amount: "",
      status: 3
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(//)
    expect(rendered).to match(//)
    expect(rendered).to match(//)
    expect(rendered).to match(//)
    expect(rendered).to match(/false/)
    expect(rendered).to match(/2/)
    expect(rendered).to match(//)
    expect(rendered).to match(/3/)
  end
end
