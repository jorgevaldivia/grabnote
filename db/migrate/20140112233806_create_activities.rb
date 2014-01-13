class CreateActivities < ActiveRecord::Migration
  def change
    create_table :activities do |t|
      t.references :user
      t.references :project
      t.text :action # e.g. Create
      t.text :item_type # e.g. Project
      t.integer :item_id # e.g. 5

      t.timestamps
    end
  end
end
