class Notebook::Note < ActiveRecord::Base
  include HasCollaborators
  include HasToken
  
  belongs_to :user
  belongs_to :notebook

  # Construct a unique key to identify the document in the backend (firebase).
  # Key is composed of the notebook and note token.
  def editor_key
    "notebooks/#{notebook.token}/notes/#{token}"
  end
end
