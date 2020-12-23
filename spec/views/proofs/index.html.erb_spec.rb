require 'rails_helper'

RSpec.describe "proofs/index", type: :view do
  before(:each) do
    assign(:proofs, [
      Proof.create!(
        :receipt => false,
        :grade => false,
        :course => nil
      ),
      Proof.create!(
        :receipt => false,
        :grade => false,
        :course => nil
      )
    ])
  end

  it "renders a list of proofs" do
    render
    assert_select "tr>td", :text => false.to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
