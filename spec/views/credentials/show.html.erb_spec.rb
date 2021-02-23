require 'rails_helper'

RSpec.describe "credentials/show", type: :view do
  before(:each) do
    @credential = assign(:credential, Credential.create!(
      :credential => "Credential",
      :description => "Description",
      :auto_approve => false,
      :degree => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Credential/)
    expect(rendered).to match(/Description/)
    expect(rendered).to match(/false/)
    expect(rendered).to match(//)
  end
end
