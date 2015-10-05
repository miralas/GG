json.array!(@requesits) do |requesit|
  json.extract! requesit, :id, :inn, :kpp, :ogrn, :oktmo, :okpo, :okato, :okogu, :okfs, :okopf, :okved1, :okved2, :okved3s, :company_id
  json.url requesit_url(requesit, format: :json)
end
