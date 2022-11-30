json.extract! report, "username"
json.repositories report.repositories, :id, :name, :tags, :profile_id