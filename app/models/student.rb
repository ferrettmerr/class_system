class Student < ActiveRecord::Base
  attr_accessible :address, :city, :fname, :lname, :major, :state, :student_id
  belongs_to :user
end
