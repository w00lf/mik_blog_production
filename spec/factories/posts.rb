require 'faker'

FactoryGirl.define do
  	factory :post do |f|
  		f.title { Faker::Lorem.sentence(3) }
    	f.keywords { Faker::Lorem.words(3).join(',') }
    	f.description { Faker::Lorem.sentence(8) }
    	f.published true
      f.postTag_list { 'foo,ruby' }
    	f.content { Faker::Lorem.paragraph(3) }
  	end

 	factory :invalid_post, parent: :post do |f|
  		f.title nil
	end
  factory :second_post, parent: :post do |f|
      f.title { Faker::Lorem.sentence(4) }
      f.content { Faker::Lorem.paragraph(3) + Faker::Lorem.sentence(1) }
  end
	
end