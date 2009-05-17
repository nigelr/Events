class CreateGroupManagers < ActiveRecord::Migration
  def self.up
    create_table :group_managers do |t|
      t.references :group
      t.references :member
      t.datetime :archived_at
      t.boolean :is_primary
      t.boolean :is_assistant

      t.timestamps
    end
  end

  def self.down
    drop_table :group_managers
  end
end
