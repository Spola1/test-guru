module TestPassagesHelper
  def test_result(test_passage)
    if test_passage.success_test?
      'Тест выполнен!'
    else
      'Тест не выполнен.'
    end
  end
end
