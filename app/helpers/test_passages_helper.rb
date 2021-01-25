module TestPassagesHelper
  def test_result
    if @test_passage.success?
      t('.Вы прошли тест!')
    else
      t('.Вы провалили тест!')
    end
  end
end
