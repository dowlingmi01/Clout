json.extract! profile, :id, :user_id, :age, :gender, :ethnicity, :country, :created_at, :updated_at
json.url profile_url(profile, format: :json)
