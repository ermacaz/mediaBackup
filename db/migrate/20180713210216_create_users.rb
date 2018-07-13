class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :username
      t.string :password_digest
      t.string :api_key

      t.timestamps
    end
    
    remove_column :documents, :documentable_id
    remove_column :documents, :documentable_type
    add_column :documents, :user_id, :integer
    add_index :documents,  :user_id
    add_index :users, :username
    add_index :users, :api_key
  end
end
