json.array!(@company_vacancies) do |company_vacancy|
  json.extract! company_vacancy, :id, :title, :requirements, :description, :employment, :salary, :company_id, :user_id
  json.url company_vacancy_url(company_vacancy, format: :json)
end
