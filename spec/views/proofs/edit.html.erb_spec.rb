require 'rails_helper'

RSpec.describe "proofs/edit", type: :view do
  before(:each) do
    @proof = assign(:proof, Proof.create!(
      :receipt => false,
      :grade => false,
      :course => nil
    ))
  end

  it "renders the edit proof form" do
    render

    assert_select "form[action=?][method=?]", proof_path(@proof), "post" do

      assert_select "input[name=?]", "proof[receipt]"

      assert_select "input[name=?]", "proof[grade]"

      assert_select "input[name=?]", "proof[course_id]"
    end
  end
end
