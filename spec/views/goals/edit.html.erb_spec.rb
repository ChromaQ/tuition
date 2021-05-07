require 'rails_helper'

RSpec.describe "goals/edit", type: :view do
  before(:each) do
    @goal = assign(:goal, Goal.create!(
      focus: "MyString",
      active: false,
      user: nil,
      school: nil,
      credential: nil
    ))
  end

  it "renders the edit goal form" do
    render

    assert_select "form[action=?][method=?]", goal_path(@goal), "post" do

      assert_select "input[name=?]", "goal[focus]"

      assert_select "input[name=?]", "goal[active]"

      assert_select "input[name=?]", "goal[user_id]"

      assert_select "input[name=?]", "goal[school_id]"

      assert_select "input[name=?]", "goal[credential_id]"
    end
  end
end
