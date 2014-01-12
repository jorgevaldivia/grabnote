class Project < ActiveRecord::Base
  include HasToken

  belongs_to :user
  # TODO(kevin): Extract collaborators
  has_many :project_collaborators
  has_many :collaborators, :through => :project_collaborators, source: :user
  has_many :notes

  after_create :populate_project

  protected
    def populate_project
      self.collaborators << self.user
      self.notes << Project::Note.create(:name => 'Welcome',
                                      :project => self)
    end
end
