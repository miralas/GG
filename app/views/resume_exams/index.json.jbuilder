json.array!(@resume_exams) do |resume_exam|
  json.extract! resume_exam, :id, :title, :organization, :specialization, :expire_year, :resume_id
  json.url resume_exam_url(resume_exam, format: :json)
end
