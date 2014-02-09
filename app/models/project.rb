class Project < ActiveRecord::Base
  include HasCollaborators
  include HasToken

  belongs_to :user
  has_many :activities, order: 'created_at ASC'
  has_many :comments
  has_many :notes
end
