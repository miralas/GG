json.array!(@company_contacts) do |company_contact|
  json.extract! company_contact, :id, :phone, :adress, :fio
  json.url company_contact_url(company_contact, format: :json)
end
