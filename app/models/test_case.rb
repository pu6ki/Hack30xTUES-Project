class TestCase < ApplicationRecord
  belongs_to :contest

  validates :expected_output, presence: true

  PASSED_TEST_CASE_POINTS = 10

  def to_s
    "#{self.class} ##{id} for #{contest}"
  end

  def passing?(output)
    test.expected_output == output
  end

  def self.calculate_points(jdoodle_api, test_cases)
    points = 0
    test_cases.each do |test|
      api_result = jdoodle_api.execute test.input
      api_output = api_result['output']

      points += TestCase::PASSED_TEST_CASE_POINTS if test.passing?(api_output)
    end

    points
  end
end
