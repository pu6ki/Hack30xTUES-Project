module SubmissionsHelper
  class JDoodleAPI
    include HTTParty
    base_uri 'https://api.jdoodle.com'

    def initialize(submission)
      @submission = submission

      @auth = {
        clientId:     ENV['JDOODLE_CLIENT_ID'],
        clientSecret: ENV['JDOODLE_CLIENT_SECRET']
      }

      @source = {
        script:   @submission.source,
        language: @submission.contest.technology.name.downcase,
        versionIndex: '1'
      }

      @headers = { 'Content-Type' => 'application/json' }
    end

    def execute(stdin)
      @source[:stdin] = stdin
      @data = @auth.merge(@source).to_json

      self.class.post('/execute', body: @data, headers: @headers)
    end
  end
end
