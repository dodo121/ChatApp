json.array!(@rooms) do |room|
  json.extract! room, :id, :title
  json.url room_url(room, format: :json)
end
