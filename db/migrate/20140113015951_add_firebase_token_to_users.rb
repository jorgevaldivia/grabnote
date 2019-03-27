class AddFirebaseTokenToUsers < ActiveRecord::Migration
  def change
    add_column :users, :firebase_auth_token, :text
    add_column :users, :firebase_auth_token_generated_at, :datetime
  end
end
