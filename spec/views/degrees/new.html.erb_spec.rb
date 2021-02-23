require 'rails_helper'

RSpec.describe "degrees/new", type: :view do
  before(:each) do
    assign(:degree, Degree.new(
      :degree => "MyString"
    ))
  end

  it "renders new degree form" do
    render

    assert_select "form[action=?][method=?]", degrees_path, "post" do

      assert_select "input[name=?]", "degree[degree]"
    end
  end
end
