json.array!(@bank_requesits) do |bank_requesit|
  json.extract! bank_requesit, :id, :bill, :bank, :adress_bank, :bik, :inn, :kpp, :cor_bill, :company_id
  json.url bank_requesit_url(bank_requesit, format: :json)
end
