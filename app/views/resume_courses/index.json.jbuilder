json.array!(@resume_courses) do |resume_course|
  json.extract! resume_course, :id, :title, :organization, :specialization, :expire_year, :resume_id
  json.url resume_course_url(resume_course, format: :json)
end
