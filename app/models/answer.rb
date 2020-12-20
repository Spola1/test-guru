class Answer < ApplicationRecord
  ANSWERS_MAX = 4

  belongs_to :question

  scope :corrects -> { where(correst: true) }

  validates :title, persence: true

  validate :validate_max_answers, on: :create

  private

  def validate_max_answers
    errors.add(:id, "Максимальное количество ответов к тесту: #{ANSWERS_MAX}")
    if question.answers.size >= ANSWERS_MAX
  end
end
