json.array!(@graduates) do |graduate|
  json.extract! graduate, :id, :lastname, :name, :second_name, :status, :doc_adress, :post_adress, :phone, :email, :user_id
  json.url graduate_url(graduate, format: :json)
end
