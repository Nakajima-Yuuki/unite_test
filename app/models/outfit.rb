class Outfit < ApplicationRecord
    validates :title, presence: true
    validates :content, presence: true
    belongs_to :proposer
    has_one_attached :image
    has_many :stocks, dependent: :destroy
    has_many :stocks_users, through: :stocks, source: :user
    has_many :likes, dependent: :destroy
end
