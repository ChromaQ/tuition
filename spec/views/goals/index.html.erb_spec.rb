require 'rails_helper'

RSpec.describe "goals/index", type: :view do
  before(:each) do
    assign(:goals, [
      Goal.create!(
        focus: "Focus",
        active: false,
        user: nil,
        school: nil,
        credential: nil
      ),
      Goal.create!(
        focus: "Focus",
        active: false,
        user: nil,
        school: nil,
        credential: nil
      )
    ])
  end

  it "renders a list of goals" do
    render
    assert_select "tr>td", text: "Focus".to_s, count: 2
    assert_select "tr>td", text: false.to_s, count: 2
    assert_select "tr>td", text: nil.to_s, count: 2
    assert_select "tr>td", text: nil.to_s, count: 2
    assert_select "tr>td", text: nil.to_s, count: 2
  end
end
