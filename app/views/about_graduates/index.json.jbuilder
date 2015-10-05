json.array!(@about_graduates) do |about_graduate|
  json.extract! about_graduate, :id, :about, :profession, :achievements, :competence, :recomendations, :photo, :graduate_id
  json.url about_graduate_url(about_graduate, format: :json)
end
