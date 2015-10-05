json.array!(@abouts) do |about|
  json.extract! about, :id, :about, :count_people, :achievements, :pluses, :company_id
  json.url about_url(about, format: :json)
end
