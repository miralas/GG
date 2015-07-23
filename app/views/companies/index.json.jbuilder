json.array!(@companies) do |company|
  json.extract! company, :id, :title, :logo, :specialization, :user
  json.url company_url(company, format: :json)
end
