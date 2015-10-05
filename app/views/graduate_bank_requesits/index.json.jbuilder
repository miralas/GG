json.array!(@graduate_bank_requesits) do |graduate_bank_requesit|
  json.extract! graduate_bank_requesit, :id, :bill, :bank, :bank_adress, :bik, :inn, :kpp, :cor_bill, :graduate_id
  json.url graduate_bank_requesit_url(graduate_bank_requesit, format: :json)
end
