json.array!(@resume_recomendations) do |resume_recomendation|
  json.extract! resume_recomendation, :id, :name, :post, :organization, :phone, :resume_id
  json.url resume_recomendation_url(resume_recomendation, format: :json)
end
