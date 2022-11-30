require 'rails_helper'

RSpec.describe "repositories/index", type: :view do
  before(:each) do
    @profile = assign(:profile, Profile.create!(username: "test-1"))
    assign(:repositories, [
      Repository.create!(name: "repo-1", tags: "t1,t2", profile_id: @profile.id),
      Repository.create!(name: "repo-2", tags: "t1,t2", profile_id: @profile.id)
    ])
  end

  it "renders a list of repositories" do
    render
  end
end
