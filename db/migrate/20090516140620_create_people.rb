class CreatePeople < ActiveRecord::Migration
  def self.up
    create_table :people do |t|
      t.column :username,      :string
      t.column :email,         :string
      t.column :password_hash, :string
      t.column :password_salt, :string
      t.timestamps
    end
  end
  
  def self.down
    drop_table :people
  end
end
