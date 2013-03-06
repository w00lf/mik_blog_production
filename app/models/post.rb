# coding: utf-8
class Post < ActiveRecord::Base
	has_many :comments, :dependent => :destroy
	
	acts_as_taggable
	acts_as_taggable_on :postTag

	validates :title, :content, :presence => true
	before_save :post_date

	scope :published, lambda { |published| where(:published => published) }
	scope :by_date, order('created_at DESC')

	attr_accessible :title, :content, :published, :description, :keywords, :postTag_list

	private
	def post_date
		timestring = Russian::strftime(Time.now, "%e %B %Y").to_s
		self.date_post = timestring
	end
end
