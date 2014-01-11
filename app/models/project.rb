class Project < ActiveRecord::Base
  include HasToken

  after_save :populate_project, on: :create

  belongs_to :user
  # TODO(kevin): Extract collaborators
  has_many :project_collaborators
  has_many :collaborators, :through => :project_collaborators, source: :user
  has_many :notes

  protected
    def populate_project
      self.collaborators << self.user
      self.notes << Project::Note.new(:name => 'Welcome',
                                      :project => self)
    end
end
