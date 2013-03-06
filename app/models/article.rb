# coding: utf-8
class Article < ActiveRecord::Base
	extend FriendlyId
	validates :title, :content, :name, :presence => true
	validates :name, :uniqueness => true
	friendly_id :name, use: :slugged

	attr_accessible :name, :title, :content, :published, :description, :keywords
end
