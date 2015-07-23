json.array!(@company_comments) do |company_comment|
  json.extract! company_comment, :id, :comment, :company_id, :user_id
  json.url company_comment_url(company_comment, format: :json)
end
