json.array!(@company_practices) do |company_practice|
  json.extract! company_practice, :id, :payment, :long, :post, :description
  json.url company_practice_url(company_practice, format: :json)
end
