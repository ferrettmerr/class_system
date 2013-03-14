class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :role
  # attr_accessible :title, :body

  has_and_belongs_to_many :classes, :class_name => UniClass, :join_table => "users_uni_classes"

  has_one :student
  ROLES = %w[student admin]

  def table_name
  	return "users_uni_classes"
  end


  def admin?
  	role == "admin"
  end

end
