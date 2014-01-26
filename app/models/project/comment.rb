class Project::Comment < Activity
  belongs_to :user
  belongs_to :project
end
