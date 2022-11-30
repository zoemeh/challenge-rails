require 'rails_helper'

RSpec.describe "repositories/edit", type: :view do
  before(:each) do
    @profile = assign(:profile, Profile.create!(username: "test-1"))
    @repository = assign(:repository, Repository.create!(name: "repo-1", tags: "t1,t2", profile_id: @profile.id))
  end

  it "renders the edit repository form" do
    render

    assert_select "form[action=?][method=?]", repository_path(@repository), "post" do
    end
  end
end
