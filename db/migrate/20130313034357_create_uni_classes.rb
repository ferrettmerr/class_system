class CreateUniClasses < ActiveRecord::Migration
  def change
    create_table :uni_classes do |t|
      t.string :code
      t.string :title
      t.string :schedule
      t.string :instructor
      t.string :room
      t.string :subject

      t.timestamps
    end
  end
end
