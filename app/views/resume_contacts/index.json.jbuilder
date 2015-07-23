json.array!(@resume_contacts) do |resume_contact|
  json.extract! resume_contact, :id, :mobile_phone, :home_phone, :work_phone, :email, :icq, :skype, :vk, :facebook, :linkedin, :resume_id
  json.url resume_contact_url(resume_contact, format: :json)
end
