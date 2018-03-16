class Submission < ApplicationRecord
  belongs_to :contestant
  belongs_to :contest

  validates :source, presence: true

  def to_s
    "#{self.class} by #{contestant} for #{contest}"
  end
end
