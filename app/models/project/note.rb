class Project::Note < ActiveRecord::Base
  include HasToken
  
  belongs_to :user
  belongs_to :project

  # Construct a unique key to identify the document in the backend (firebase).
  # Key is composed of the notebook and note token.
  def editor_key
    "project/#{project.token}/note/#{token}"
  end
end
