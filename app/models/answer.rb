class Answer < ApplicationRecord
  ANSWERS_MAX = 4

  belongs_to :question

  scope :correct -> { where(correct: true) }

  validates :title, persence: true

  validate :validate_max_answers, on: :create

  private

  def validate_max_answers
    errors.add(:question, "Максимальное количество ответов к тесту: #{ANSWERS_MAX}")
    if question.answers.size >= ANSWERS_MAX
  end
end
