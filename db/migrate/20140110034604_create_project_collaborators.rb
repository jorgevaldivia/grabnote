class CreateProjectCollaborators < ActiveRecord::Migration
  def change
    create_table :project_collaborators do |t|
      t.belongs_to :project
      t.belongs_to :user
      t.timestamps
    end
  end
end
