class CreateUsersUniClassesTable < ActiveRecord::Migration
  def self.up
    create_table :users_uni_classes, :id => false do |t|
        t.references :user
        t.references :uni_class
    end
    add_index :users_uni_classes, [:uni_class_id, :user_id]
    add_index :users_uni_classes, [:user_id, :uni_class_id]
  end

  def self.down
    drop_table :users_uni_classes
  end
end
