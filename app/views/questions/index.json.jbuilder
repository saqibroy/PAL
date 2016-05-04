json.array!(@questions) do |question|
  json.extract! question, :id, :content, :course
  json.url question_url(question, format: :json)
end
