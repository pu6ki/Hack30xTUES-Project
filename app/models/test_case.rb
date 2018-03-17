class TestCase < ApplicationRecord
  belongs_to :contest

  validates :expected_output, presence: true

  PASSED_TEST_CASE_POINTS = 10

  def to_s
    "#{self.class} ##{id} for #{contest}"
  end

  def self.calculate_points(jdoodle_api, test_cases)
    points = 0
    test_cases.each do |test|
      api_result = jdoodle_api.execute test.input

      is_correct_answer = api_result['output'] == test.expected_output
      points += TestCase::PASSED_TEST_CASE_POINTS if is_correct_answer
    end

    points
  end
end
