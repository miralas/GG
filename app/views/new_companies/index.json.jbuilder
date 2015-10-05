json.array!(@new_companies) do |new_company|
  json.extract! new_company, :id, :company_type, :full_title, :short_title, :english_title, :specialization, :logo, :full_adress, :post_adress, :phone, :faks, :email, :website, :director_name, :director_post, :contact_name, :contacy_phone, :contact_email, :user_id
  json.url new_company_url(new_company, format: :json)
end
