class TestPassagesController < ApplicationController

  before_action :authenticate_user!
  before_action :find_test_passage, only: [:show, :update, :result, :gist]

  def show

  end

  def result

  end

  def gist
    service = GistQuestionService.new(@test_passage.current_question)
    result = service.call

    flash_options =
      if service.success?
        current_user.gists.create(question: @test_passage.current_question, github_id: result.id)
        { notice: t('.success', url: result.html_url) }
      else
        { alert: t('.failure') }
      end

    redirect_to @test_passage, flash_options
  end

  def update
    @test_passage.accept!(params[:answer_ids])

    if @test_passage.completed?
      TestsMailer.completed_test(@test_passage).deliver_now
      redirect_to result_test_passage_path(@test_passage)
    else
      render :show
    end
  end

  private

  def find_test_passage
    @test_passage = TestPassage.find(params[:id])
  end

end
