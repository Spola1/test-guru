module QuestionsCTestHelper
  def question_header(question)
    if question.new_record?
      "Create New Question: #{question.test.title}"
    else
      "Edit Question: #{question.test.title}"
    end
  end
end
