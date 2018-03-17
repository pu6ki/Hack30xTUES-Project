class CalculateTestCasePointsService
  def self.perform(jdoodle_client, test_cases)
    points = 0
    test_cases.each do |test|
      api_result = jdoodle_client.execute test.input
      api_output = api_result['output']

      points += TestCase::PASSED_TEST_CASE_POINTS if test.passing?(api_output)
    end

    points
  end
end
