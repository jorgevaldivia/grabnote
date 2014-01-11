class Project < ActiveRecord::Base
  include HasToken

  belongs_to :user
  has_many :project_collaborators
  has_many :collaborators, :through => :project_collaborators, source: :user
  has_many :notes
end
