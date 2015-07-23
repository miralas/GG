json.array!(@resume_posts) do |resume_post|
  json.extract! resume_post, :id, :wish_post, :specialization, :salary, :employment, :timetable, :resume
  json.url resume_post_url(resume_post, format: :json)
end
