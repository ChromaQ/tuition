require 'rails_helper'

RSpec.describe "goals/show", type: :view do
  before(:each) do
    @goal = assign(:goal, Goal.create!(
      focus: "Focus",
      active: false,
      user: nil,
      school: nil,
      credential: nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Focus/)
    expect(rendered).to match(/false/)
    expect(rendered).to match(//)
    expect(rendered).to match(//)
    expect(rendered).to match(//)
  end
end
