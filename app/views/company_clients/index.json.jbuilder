json.array!(@company_clients) do |company_client|
  json.extract! company_client, :id, :title, :website, :description
  json.url company_client_url(company_client, format: :json)
end
