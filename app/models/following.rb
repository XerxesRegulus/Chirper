class Following < ActiveRecord::Base
  belongs_to :user
  has_many :following, through: :user
end
