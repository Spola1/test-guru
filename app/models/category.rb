class Category < ApplicationRecord
  has_many :tests

  def_scope { order(:title) }

  validates :title, presence: true
end
