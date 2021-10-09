class Like < ApplicationRecord
  belongs_to :user
  belongs_to :outfit
  validates_uniqueness_of :outfit_id, scope: :user_id 
end
