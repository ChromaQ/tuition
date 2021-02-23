require 'rails_helper'

RSpec.describe "credentials/edit", type: :view do
  before(:each) do
    @credential = assign(:credential, Credential.create!(
      :credential => "MyString",
      :description => "MyString",
      :auto_approve => false,
      :degree => nil
    ))
  end

  it "renders the edit credential form" do
    render

    assert_select "form[action=?][method=?]", credential_path(@credential), "post" do

      assert_select "input[name=?]", "credential[credential]"

      assert_select "input[name=?]", "credential[description]"

      assert_select "input[name=?]", "credential[auto_approve]"

      assert_select "input[name=?]", "credential[degree_id]"
    end
  end
end
