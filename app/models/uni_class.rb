class UniClass < ActiveRecord::Base
  attr_accessible :code, :instructor, :room, :schedule, :subject, :title
  
  has_and_belongs_to_many :users, :join_table => "users_uni_classes"

  
  def self.search(params)
	  conditions = []

	  classes = UniClass.scoped

	  if params.has_key?(:instructor)
	  	classes = classes.where('instructor LIKE ?', "%#{params[:instructor]}%")
	  end

	  if params.has_key?(:subject)
			classes = classes.where('subject LIKE ?', "%#{params[:subject]}%")
	  end

	  return classes
	end
end
