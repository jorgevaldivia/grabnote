# Add this to a model that has collaborators (notes, projects, etc)
module HasCollaborators
  extend ActiveSupport::Concern
  included do
    has_many :collaborator_joins, as: :collaboratable
    has_many :collaborators, through: :collaborator_joins, source: :user
  end
end