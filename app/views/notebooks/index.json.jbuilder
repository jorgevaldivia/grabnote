json.array!(@notebooks) do |notebook|
  json.extract! notebook, :id, :user_id, :name, :description, :token
  json.url notebook_url(notebook, format: :json)
end
