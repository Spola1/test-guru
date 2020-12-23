class User < ApplicationRecord
  has_many :created_tests, class_name: "Test", foreign_key: :user_id, dependent: :nullify
  has_many :test_passages
  has_many :tests, through: :test_passages

  validates :name, :email, presence: true

  def tests_passage(level)
    tests.where(level: level)
  end
end
