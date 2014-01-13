class Notebook < ActiveRecord::Base
  include HasCollaborators
  include HasToken

  belongs_to :user

  validates :name, presence: true
end
