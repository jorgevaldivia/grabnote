class Project < ActiveRecord::Base
  include HasToken

  belongs_to :user
  # TODO(kevin): Extract collaborators
  has_many :project_collaborators
  has_many :collaborators, :through => :project_collaborators, source: :user
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
