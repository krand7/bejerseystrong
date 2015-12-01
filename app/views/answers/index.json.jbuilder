json.array!(@answers) do |answer|
  json.extract! answer, :id, :value, :deleted, :content, :slug
  json.url answer_url(answer, format: :json)
end
