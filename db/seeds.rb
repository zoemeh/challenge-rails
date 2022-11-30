def set_repositories
  result = []
  Faker::Number.between(from: 1, to: 5).times do
    def set_tags
      tags = []
      Faker::Number.between(from: 1, to: 5).times do
        tags.append(Faker::Internet::slug)
      end
      tags.join(',')
    end
    result.append({ 'name': Faker::Internet::slug, 'tags': set_tags })
  end
  result
end

100.times do
  Profile.create(username: Faker::Internet::username)
end

Profile.all.each do |profile|
  profile.repositories.insert_all(set_repositories)
end