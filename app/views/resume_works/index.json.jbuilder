json.array!(@resume_works) do |resume_work|
  json.extract! resume_work, :id, :organization, :region, :website, :sphere, :post, :begin_work, :end_work, :functions, :skills, :about, :resume_id
  json.url resume_work_url(resume_work, format: :json)
end
