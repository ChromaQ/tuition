require 'rails_helper'

RSpec.describe "degrees/index", type: :view do
  before(:each) do
    assign(:degrees, [
      Degree.create!(
        :degree => "Degree"
      ),
      Degree.create!(
        :degree => "Degree"
      )
    ])
  end

  it "renders a list of degrees" do
    render
    assert_select "tr>td", :text => "Degree".to_s, :count => 2
  end
end
