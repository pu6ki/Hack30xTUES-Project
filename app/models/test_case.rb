class TestCase < ApplicationRecord
  belongs_to :contest

  validates :expected_output, presence: true

  def to_s
    "#{self.class} ##{id} for #{contest}"
  end
end
