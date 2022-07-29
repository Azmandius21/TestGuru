module QuestionsHelper
  def question_header(test, question)
    if question.new_record?
      "Create New Test #{test.title} Question"
    else
      "Edit Test #{test.title} Question"
    end
  end

  def current_year
    Time.now.year
  end

  def github_url(author,repo)
    link_to "#{author}", "#{repo}", target: "_blank" 
  end
end
