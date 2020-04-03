json.extract! eventpost, :id, :post, :created_at, :updated_at
json.url eventpost_url(eventpost, format: :json)
