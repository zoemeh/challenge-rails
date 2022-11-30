require 'rails_helper'

RSpec.describe "profiles/show", type: :view do
  before(:each) do
    @profile = assign(:profile, Profile.create!(username: "test-1"))
  end

  it "renders attributes in <p>" do
    render
  end
end
