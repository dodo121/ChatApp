json.array!(@conversations) do |conversation|
  json.extract! conversation, :id, :title
  json.url conversation_url(conversation, format: :json)
end
