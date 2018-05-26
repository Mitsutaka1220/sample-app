class Favorite < ApplicationRecord
	belongs_to :from_user, class_name: "User"
  belongs_to :to_micropost, class_name: "Micropost"
  validates :from_user_id, presence: true
  validates :to_micropost_id, presence: true
end
