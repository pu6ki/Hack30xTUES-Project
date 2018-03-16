class Contestant < ApplicationRecord
  has_one :user, as: :userable, required: true

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :school, presence: true

  belongs_to :school
end
