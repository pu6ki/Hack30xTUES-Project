class SendSubmissionService
  def self.perform(submission)
    jdoodle_client = Jdoodle::Client.new(submission)
    points = CalculateTestCasePointsService.perform jdoodle_client, submission.contest.test_cases

    submission.update_attributes(points: points)

    if points == submission.contest.max_points
      submission.update_attributes(solving: true)
    end

    if submission.contestant.solving_submissions(submission.contest).empty?
      submission.contestant.schools.each do |school|
        school.update_attributes(points: school.points + points)
      end
    end
  end
end
