json.array!(@company_reviews) do |company_review|
  json.extract! company_review, :id, :review, :mark, :user_id
  json.url company_review_url(company_review, format: :json)
end
