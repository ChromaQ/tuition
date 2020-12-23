require 'rails_helper'

RSpec.describe "proofs/show", type: :view do
  before(:each) do
    @proof = assign(:proof, Proof.create!(
      :receipt => false,
      :grade => false,
      :course => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/false/)
    expect(rendered).to match(/false/)
    expect(rendered).to match(//)
  end
end
