class TestPassagesValue < ActiveRecord::Migration[5.2]
  def change
    add_column :test_passages, :points, :integer
  end

  def up
    change_column_default(:test_passages, :correct_questions, 0)
  end

  def down
    change_column_default(:test_passages, :correct_questions, nil)
  end

end
