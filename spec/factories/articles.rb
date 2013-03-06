require 'faker'

FactoryGirl.define do
  factory :article do |f|
  	f.title { Faker::Lorem.sentence(3) }
  	f.name { Faker::Lorem.sentence(1) }
    f.keywords { Faker::Lorem.words(3).join(',') }
    f.description { Faker::Lorem.sentence(8) }
    f.published true
    f.content { Faker::Lorem.paragraph(3) }
  end
end