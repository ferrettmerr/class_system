class Student < ActiveRecord::Base
  attr_accessible :address, :city, :fname, :lname, :major, :state, :student_id
  has_one :user
end
