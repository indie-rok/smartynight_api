class Contact < ActiveRecord::Base
	has_one :topic
	validates :topic_id, presence: true
	validates :name, presence: true, length: { minimum: 5 }
	validates :email, presence: true, length: { minimum: 10 }
	validates :message, presence: true, length: { minimum: 15 }

end
