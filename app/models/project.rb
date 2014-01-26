class Project < ActiveRecord::Base
  include HasCollaborators
  include HasToken

  belongs_to :user
  has_many :activities
  has_many :notes
end
