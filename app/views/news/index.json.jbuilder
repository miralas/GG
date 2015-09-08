json.array!(@news) do |news|
  json.extract! news, :id, :title, :content, :publish, :image
  json.url news_url(news, format: :json)
end
