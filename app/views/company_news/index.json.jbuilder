json.array!(@company_news) do |company_news|
  json.extract! company_news, :id, :title, :body
  json.url company_news_url(company_news, format: :json)
end
