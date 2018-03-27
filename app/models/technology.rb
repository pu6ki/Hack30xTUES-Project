class Technology < ApplicationRecord
  validates :name, presence: true, uniqueness: true, length: { maximum: 50 }

  def to_s
    name
  end
end
