require 'rails_helper'

RSpec.describe "proofs/new", type: :view do
  before(:each) do
    assign(:proof, Proof.new(
      :receipt => false,
      :grade => false,
      :course => nil
    ))
  end

  it "renders new proof form" do
    render

    assert_select "form[action=?][method=?]", proofs_path, "post" do

      assert_select "input[name=?]", "proof[receipt]"

      assert_select "input[name=?]", "proof[grade]"

      assert_select "input[name=?]", "proof[course_id]"
    end
  end
end
