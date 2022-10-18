GIST_URL = 'https://gist.github.com'.freeze

class GistQuestionService
  def initialize(question, client = default_client)
    @question = question
    @test = @question.test
    @client = client
  end

  GistUrl = Struct.new(:url) do
    def success?
      url.include? GIST_URL
    end
  end

  def call
    gist = @client.create_gist(gist_params)
    GistUrl.new(gist.html_url)
  end

  private

  def default_client
    Octokit::Client.new(access_token: ENV.fetch('GITHUB_GIST_TOKEN'))
  end

  def gist_params
    {
      descriptions: I18n.t('.gist_title', test_title: @test.title),
      files: {
        'test-guru-question.txt' => {
          content: gist_content
        }
      }
    }
  end

  def gist_content
    [@question.body, @question.answers.pluck(:body)].join("\n")
  end
end
