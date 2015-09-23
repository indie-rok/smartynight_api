class Party < ActiveRecord::Base
	belongs_to :venue

	scope :filter_by_name, lambda { |keyword|
		where("lower(name) LIKE ? and status=='published'", "%#{keyword.downcase}%" )
    	
  	}

end
