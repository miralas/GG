json.array!(@banners) do |banner|
  json.extract! banner, :id, :banner_region_id, :path
  json.url banner_url(banner, format: :json)
end
