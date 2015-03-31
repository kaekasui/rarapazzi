json.array!(@photos) do |photo|
  json.extract! photo, :id, :link, :image_url, :event_id
  json.url photo_url(photo, format: :json)
end
