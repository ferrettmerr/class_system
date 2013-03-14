class CreateStudents < ActiveRecord::Migration
  def change
    create_table :students do |t|
      t.string :student_id
      t.string :fname
      t.string :lname
      t.string :major
      t.string :address
      t.string :city
      t.string :state

      t.timestamps
    end
  end
end
