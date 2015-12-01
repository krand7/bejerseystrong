json.array!(@questions) do |question|
  json.extract! question, :id, :content, :display_type, :slug, :deleted
  json.url question_url(question, format: :json)
end
