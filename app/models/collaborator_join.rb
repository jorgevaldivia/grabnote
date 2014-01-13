class CollaboratorJoin < ActiveRecord::Base
  belongs_to :user
  belongs_to :collaboratable, polymorphic: true
end
