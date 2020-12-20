class Test < ApplicationRecord
  has_many :questions
  belongs_to :category
  belongs_to :author, class_name: "User", foreign_key: :user_id
  has_many :test_passages
  has_many :users, through: :test_passages

  scope :level_easy -> { where(level: 0..1) }
  scope :level_middle -> { where(level: 2..4) }
  scope :level_hard -> { where(level: 5..Float::INFINITY) }

  scope :tests_by_category -> (category) do
    joins(:category)
    .where('categories.title=?', category)
  end

  validates :title, presence: true, uniq: { scope: :level }
  validates :level, numericality: { only_integer: true, positive: 0 }

  def self.category_by_title(category)
    tests_by_category(category)
    .order('tests.title DESC')
    .pluck(:title)
  end
end
