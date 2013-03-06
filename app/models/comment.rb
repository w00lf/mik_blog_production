class Comment < ActiveRecord::Base
	belongs_to :posts
	validates :content, :presence => true
	before_save :post_date

	attr_accessible :content, :user_id

	private 
	def post_date
		timestring = Russian::strftime(Time.now, "%H:%M /%e %B %Y").to_s
		self.comm_date = timestring
	end

end
