require 'rails_helper'

RSpec.describe "credentials/index", type: :view do
  before(:each) do
    assign(:credentials, [
      Credential.create!(
        :credential => "Credential",
        :description => "Description",
        :auto_approve => false,
        :degree => nil
      ),
      Credential.create!(
        :credential => "Credential",
        :description => "Description",
        :auto_approve => false,
        :degree => nil
      )
    ])
  end

  it "renders a list of credentials" do
    render
    assert_select "tr>td", :text => "Credential".to_s, :count => 2
    assert_select "tr>td", :text => "Description".to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
