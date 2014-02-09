class CreateProjectUploads < ActiveRecord::Migration
  def change
    create_table :project_uploads do |t|
      t.belongs_to :project, index: true
      t.belongs_to :user, index: true
      t.string :name
      t.text :key

      t.timestamps
    end
  end
end
