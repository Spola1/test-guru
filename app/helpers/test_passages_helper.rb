module TestPassagesHelper
  TEST_PERCENT = 0.85

  def test_tesult(test_passage)
    if percent >= TEST_PERCENT
      true
    else
      false
    end
  end

  def percent
    @test_passage.correct_question.to_f/@test_passage.test.questions.count.to_f
  end
end
