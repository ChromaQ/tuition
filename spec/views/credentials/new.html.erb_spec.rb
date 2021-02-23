require 'rails_helper'

RSpec.describe "credentials/new", type: :view do
  before(:each) do
    assign(:credential, Credential.new(
      :credential => "MyString",
      :description => "MyString",
      :auto_approve => false,
      :degree => nil
    ))
  end

  it "renders new credential form" do
    render

    assert_select "form[action=?][method=?]", credentials_path, "post" do

      assert_select "input[name=?]", "credential[credential]"

      assert_select "input[name=?]", "credential[description]"

      assert_select "input[name=?]", "credential[auto_approve]"

      assert_select "input[name=?]", "credential[degree_id]"
    end
  end
end
