class CreateProjectNotes < ActiveRecord::Migration
  def change
    create_table :project_notes do |t|
      t.references :user, index: true
      t.references :project, index: true
      t.string :name
      t.string :token

      t.timestamps
    end

    change_table :projects do |t|
      t.string :token
    end
  end
end
