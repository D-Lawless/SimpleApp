json.extract! event, :id, :title, :about, :created_at, :updated_at
json.url event_url(event, format: :json)
