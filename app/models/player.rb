class Player < ApplicationRecord
  belongs_to :team
  has_many :performances, dependent: :destroy
  has_many :achievements, through: :performances

  validates :name, presence: true
end
