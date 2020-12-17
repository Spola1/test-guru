class Test < ApplicationRecord
  has_many :questions
  belongs_to :category
  belongs_to :author, class_name: "User", foreign_key: :user_id
  has_many :test_passages
  has_many :users, through: :test_passages

  def self.by_category_title(category_title)
    joins(:category)
    .where('categories.title = ?', category_title)
    .order('tests.title DESC')
    .pluck(:title)
  end
end
