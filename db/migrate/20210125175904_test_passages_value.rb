class TestPassagesValue < ActiveRecord::Migration[5.2]
  def change
    add_column :test_passages, :points, :integer, default: 0
  end
end
