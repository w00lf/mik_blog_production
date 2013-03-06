require 'faker'

FactoryGirl.define do

	factory :comment do |f|
  		f.content { Faker::Lorem.sentence(3) }
    	f.post_id { nil }
  	end
end