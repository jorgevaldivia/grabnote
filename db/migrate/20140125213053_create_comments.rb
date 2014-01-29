class CreateComments < ActiveRecord::Migration
  def change
    create_table :project_comments do |t|
      t.belongs_to :user, index: true
      t.belongs_to :project, index: true
      t.text :body

      t.timestamps
    end
  end
end
