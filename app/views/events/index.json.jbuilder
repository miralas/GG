json.array!(@events) do |event|
  json.extract! event, :id, :author_id, :title, :text, :starts_at, :ends_at, :all_day
  json.url event_url(event, format: :json)
end
