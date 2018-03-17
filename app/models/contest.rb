class Contest < ApplicationRecord
  belongs_to :recruiter
  belongs_to :technology

  validates :title, presence: true
  validates :description, presence: true, length: { minimum: 5 }
  validates :deadline, presence: true

  has_many :test_cases
  has_many :submissions

  def max_points
    test_cases.count * TestCase::PASSED_TEST_CASE_POINTS
  end

  def to_s
    "\"#{title}\" by #{recruiter}"
  end
end
