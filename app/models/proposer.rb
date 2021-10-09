class Proposer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :username, presence: true #追記
  validates :profile, length: { maximum: 200 } #追記
  has_one_attached :avatar
  has_many :outfits, dependent: :destroy

  def self.guest
    find_or_create_by!(email: 'guest_proposer@example.com') do |proposer|
      proposer.name = 'ゲストファッショニスタ'
      proposer.password = SecureRandom.urlsafe_base64
    end
  end
end
