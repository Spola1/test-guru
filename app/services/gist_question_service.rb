class GistQuestionService

  attr_reader :client

  def initialize(question)
    @question = question
    @test = @question.test
    @client = client || Octokit::Client.new(access_token: ENV['GITHUB_TOKEN'])

  def call
    @client.create_gist(gist_params)
  end

  def success?
    @client.last_response.status == 200 || 201
  end

  private

  def gist_params
    {
      description: I18n.t('services.gist_params.question_description', title: @test.title),
      files: {
        'test-guru-question.txt' => {
          content: gist_content
        }
      }
    }
  end

  def gist_content
    content = [@question.body]
    content += @question.answers.pluck(:body)
    content.join("\n")
  end

end
