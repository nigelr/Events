class CreateMemberships < ActiveRecord::Migration
  def self.up
    create_table :memberships do |t|
      t.references :person
      t.references :group
      t.datetime :archived_at
      t.timestamps
    end
  end
  
  def self.down
    drop_table :memberships
  end
end
