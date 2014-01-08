class CreateNotebookNotes < ActiveRecord::Migration
  def change
    create_table :notebook_notes do |t|
      t.references :user, index: true
      t.references :notebook, index: true
      t.string :name
      t.string :token

      t.timestamps
    end
  end
end
