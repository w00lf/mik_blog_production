class User < ActiveRecord::Base
	# Include default devise modules. Others available are:
	# :token_authenticatable, :confirmable,
	# :lockable, :timeoutable and :omniauthable

	devise :omniauthable, :database_authenticatable, :registerable, :confirmable, :recoverable, :rememberable, :trackable, :validatable, :lockable, :authentication_keys => [:email], :omniauth_providers => [:facebook,:vkontakte,:google_oauth2,:twitter,:yandex,:github]

	# Setup accessible (or protected) attributes for your model
	attr_accessible :username, :email, :password, :password_confirmation, :remember_me, :provider, :uid

	def self.find_for_common_oauth(auth, signed_in_resource=nil)
		email = auth.info.email || "#{auth.provider}_#{Devise.friendly_token[0,10]}@programmerontes.info"
		user_data ={ username: auth.info.name, 
                     provider: auth.provider,
                     uid: auth.uid,
                     email: email,
                     password: Devise.friendly_token[0,20] }
		return self.get_oauth_user(user_data)
	end

	def self.get_oauth_user user_data 
		user = User.where(:provider => user_data[:provider], :uid => user_data[:uid]).first
		unless user
			user = User.new(user_data)
			user.skip_confirmation!
			user.save
		end
		user
	end
end
