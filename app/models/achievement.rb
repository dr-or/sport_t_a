class Achievement < ApplicationRecord
  has_many :performances, dependent: :destroy
  has_many :players, through: :performances

  validates :body, presence: true
end
