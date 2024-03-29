class User < ActiveRecord::Base
  attr_accessible :name, :provider, :uid, :invites

	has_many :tasks

	default_scope order('name ASC')

	def self.create_with_omniauth(auth)
		create! do |user|
			user.provider = auth['provider']
			user.uid = auth['uid']
			user.name = auth['info']['name']
		end
	end

	def to_s
		name
	end
end
