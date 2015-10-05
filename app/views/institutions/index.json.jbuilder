json.array!(@institutions) do |institution|
  json.extract! institution, :id, :org_type, :title, :logo, :full_adress, :post_adress, :phone, :faks, :email, :website, :director_fio, :director_post, :contact_fio, :contact_phone, :contact_email, :user_id
  json.url institution_url(institution, format: :json)
end
