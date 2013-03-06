require 'faker'

FactoryGirl.define do
	factory :admin, class: User do 
		username { Faker::Internet.user_name }
		email { Faker::Internet.free_email }
		password { 'blabla' }
		password_confirmation { 'blabla' }
		admin { true }
		confirmed_at Time.now
	end
	factory :user do 
		username { Faker::Internet.user_name }
		email { Faker::Internet.free_email }
		password { 'blabla' }
		password_confirmation { 'blabla' }
		confirmed_at Time.now
		admin { false }
	end
end