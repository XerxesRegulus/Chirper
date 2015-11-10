class FollowingSerializer < ActiveModel::Serializer
  attributes :id, :user_id, :following_id, :user, :following
end
