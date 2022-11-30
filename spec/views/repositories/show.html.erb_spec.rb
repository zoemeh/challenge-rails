require 'rails_helper'

RSpec.describe "repositories/show", type: :view do
  before(:each) do
    @profile = assign(:profile, Profile.create!(username: "test-1"))
    @repository = assign(:repository, Repository.create!(name: "repo-1", tags: "t1,t2", profile_id: @profile.id))
  end

  it "renders attributes in <p>" do
    render
  end
end
