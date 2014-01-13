class Notebook::Note < ActiveRecord::Base
  include HasToken
  include HasFirebase
  
  belongs_to :user
  belongs_to :notebook

  # Construct a unique key to identify the document in the backend (firebase).
  # Key is composed of the notebook and note token.
  def firebase_key
    "notebooks/#{notebook.token}/notes/#{token}"
  end
end
