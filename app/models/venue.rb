class Venue < ActiveRecord::Base

	belongs_to :user

	has_many :recent_searches
	#belongs_to :city
	has_many :venue_photos
	has_many :venue_ratings
	has_many :parties, :foreign_key => 'venue_id'

	def average_rating
		self.venue_ratings.average(:rating).to_i
	end

	def user_count
		self.venue_ratings.count
	end

	def avatar_picture
		if self.user.nil?
			nil
		else
			self.user.avatar_url
		end
	end


	scope :filter_by_name, lambda { |keyword|
   	 where("lower(name) LIKE ?", "%#{keyword.downcase}%" ) 
  	}

end
