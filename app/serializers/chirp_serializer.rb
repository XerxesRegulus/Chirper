class ChirpSerializer < ActiveModel::Serializer
  attributes :id, :content, :user_id, :user
  
end