class Project < ActiveRecord::Base
  include HasCollaborators
  include HasToken

  belongs_to :user
  has_many :notes
  has_many :activities

  after_create :populate_project

  protected
    def populate_project
      self.collaborators << self.user
      self.activities << Activity.new(:project => self,
                                              :user => self.user,
                                              :action => Activity.created,
                                              :item_type => Activity.project,
                                              :item_id => self.id)
    end
end
