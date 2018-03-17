class TestCase < ApplicationRecord
  belongs_to :contest

  validates :expected_output, presence: true

  PASSED_TEST_CASE_POINTS = 10

  def to_s
    "#{self.class} ##{id} for #{contest}"
  end
end
