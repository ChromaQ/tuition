require 'rails_helper'

RSpec.describe "goals/new", type: :view do
  before(:each) do
    assign(:goal, Goal.new(
      focus: "MyString",
      active: false,
      user: nil,
      school: nil,
      credential: nil
    ))
  end

  it "renders new goal form" do
    render

    assert_select "form[action=?][method=?]", goals_path, "post" do

      assert_select "input[name=?]", "goal[focus]"

      assert_select "input[name=?]", "goal[active]"

      assert_select "input[name=?]", "goal[user_id]"

      assert_select "input[name=?]", "goal[school_id]"

      assert_select "input[name=?]", "goal[credential_id]"
    end
  end
end
