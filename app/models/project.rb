class Project < ActiveRecord::Base
  include HasCollaborators
  include HasToken

  belongs_to :user
  has_many :notes

  after_create :populate_project

  protected
    def populate_project
      self.collaborators << self.user
    end
end
