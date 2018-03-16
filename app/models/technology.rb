class Technology < ApplicationRecord
  validates :name, presence: true, uniqueness: true, length: { maximum: 50 }
  validates :hackerrank_code, presence: true, uniqueness: true
end