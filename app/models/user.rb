class User < ActiveRecord::Base
	has_many :tweets

	has_many :follower_relationships, class_name: "Following", foreign_key: "followee_id"
	has_many :followee_relationships, class_name: "Following", foreign_key: "follower_id"

	has_many :followers, through: :follower_relationships, source: "follower"
	has_many :followees, through: :followee_relationships, source: "followee"

	# validates :username, presence: true
	# validates :username, uniqueness: true
end
