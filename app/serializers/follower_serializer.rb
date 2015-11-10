class FollowerSerializer < ActiveModel::Serializer
  attributes :id, :user_id, :follower_id, :user, :follower
end
