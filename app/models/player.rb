class Player < ApplicationRecord
  belongs_to :team
  has_many :performances, dependent: :destroy
  has_many :results, through: :performances

  validates :first_name, presence: true
  validates :last_name, presence: true
end
