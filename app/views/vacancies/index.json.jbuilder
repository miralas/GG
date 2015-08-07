json.array!(@vacancies) do |vacancy|
  json.extract! vacancy, :id, :title, :requirements, :description, :employment, :salary, :user_id, :company_id
  json.url vacancy_url(vacancy, format: :json)
end
