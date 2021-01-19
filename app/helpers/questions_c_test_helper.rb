module QuestionsCTestHelper
  def question_header(question)
    if question.new_record?
      "Create New Question: #{questin.test.title}"
    else
      "Edit Question: #{question.tesst.title}"
    end
end
