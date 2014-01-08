class CreateNotebooks < ActiveRecord::Migration
  def change
    create_table :notebooks do |t|
      t.references :user, index: true
      t.string :name
      t.text :description
      t.string :token

      t.timestamps
    end
  end
end
