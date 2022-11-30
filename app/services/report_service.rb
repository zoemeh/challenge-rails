require 'external/client'

class ReportService
  def generate
    external_client = ::External::Client.new
    profiles = external_client.fetch_profiles
    repositories = external_client.fetch_repositories
    profiles.map do |profile|
      profile_model = Profile.new(profile)
      profile_model.repositories = repositories.map do |repository|
        next unless repository['profile_id'] == profile['id']
        Repository.new repository
      end.compact
      profile_model
    end
  end
end
