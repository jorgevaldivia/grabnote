# Add this to a model that has collaborators (notes, projects, etc)
module HasCollaborators
  extend ActiveSupport::Concern
  included do
    has_many :collaborator_joins, as: :collaboratable
    has_many :collaborators, through: :collaborator_joins, source: :user
  end

  # Add users as collaborators to the record. If the model also has firebase,
  # tell firebase about the new collabs
  def add_collaborators user_ids
    self.collaborator_ids += Array.wrap(user_ids)
    
    if self.respond_to?(:update_firebase_collaborators)
      self.update_firebase_collaborators
    end
  end

  # Remove users as collabs from the record. If the model also has firebase,
  # tell firebase to remove collaborators
  def remove_collaborators user_ids
    self.collaborator_ids -= Array.wrap(user_ids)
    
    if self.respond_to?(:update_firebase_collaborators)
      self.update_firebase_collaborators
    end
  end
end