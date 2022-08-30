json.extract! survey, :id, :survey_name, :description, :location, :created_at, :updated_at
json.url survey_url(survey, format: :json)
