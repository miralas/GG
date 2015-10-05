json.array!(@graduate_requesits) do |graduate_requesit|
  json.extract! graduate_requesit, :id, :birth_date, :place_birth, :nationality, :sex, :inn, :graduate_id
  json.url graduate_requesit_url(graduate_requesit, format: :json)
end
