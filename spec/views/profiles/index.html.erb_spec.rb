require 'rails_helper'

RSpec.describe "profiles/index", type: :view do
  before(:each) do
    assign(:profiles, [
      Profile.create!(username: "test-1"),
      Profile.create!(username: "test-2")
    ])
  end

  it "renders a list of profiles" do
    render
  end
end
