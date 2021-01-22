class TestPassage < ApplicationRecord
  belongs_to :test
  belongs_to :user
  belongs_to :current_question, class_name: 'Question', optional: true

  def completed?
    current_question.nil?
  end

  def accept!(answer_ids)
    if correct_answer?(answer_ids)
      self.correct_question += 1
    end

    save!
  end

  private

  def before_validation_set_first_question
    self.current_question = test.questions.first if test.present?
  end

  def correct_answer?(answer_ids)
    correct.answers.ids.sort == answer_ids.map if test.present?
  end

  def correst_answers
    current_question.answers.correct
  end

  def before_save_next_question
    self.current_question = test.questions.order(:id).where('id > ?', current_question.id).first
end
