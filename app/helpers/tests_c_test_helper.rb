module TestsCTestHelper

  TEST_LVL = {0 => :easy, 1 => :elementary, 2 => :advanced, 3 => :hard}

  def test_level(test)
    TEST_LVL[test.level] || :hero
  end

  def test_questions_count(test)
    test.question.count
  end
end
