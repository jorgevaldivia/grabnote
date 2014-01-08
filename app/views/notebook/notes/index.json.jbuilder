json.array!(@notebook_notes) do |notebook_note|
  json.extract! notebook_note, :id, :user_id, :notebook_id, :name, :token
  json.url notebook_note_url(notebook_note, format: :json)
end
