class CreateCollaboratorJoins < ActiveRecord::Migration
  def change
    create_table :collaborator_joins do |t|
      t.references :user, index: true
      t.integer :collaboratable_id, index: true
      t.string :collaboratable_type, index: true

      t.timestamps
    end
  end
end
