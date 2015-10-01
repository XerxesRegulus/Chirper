class Follower < ActiveRecord::Base
  belongs_to :user
  has_many :followers, through: :users
end
