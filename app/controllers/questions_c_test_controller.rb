class QuestionsCTestController < ApplicationController

  before_action :find_test, only: i%[create]
  before_action :find_question, only: %i[show destroy]

  rescue_from ActiveRecord::RecordNotFound, with: :question_not_found

  def new
    @question = @test.questions.new
  end

  def create
    @question = test.question.new(questions_params)
    @question.save
  end

  def show
    render plain: @question.body
  end

  def destroy
    @question.destroy
    redirect_to @question.test
  end

  private

  def question_params
    params.require(:question).permit(:body)
  end

  def find_test
    @test = Test.find(params[:test_id])
  end

  def find_question
    @question = Question.find(params[:id])
  end

  def question_not_found
    render plain: 'Вопрос не найден'
end
