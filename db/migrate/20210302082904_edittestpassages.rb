class Edittestpassages < ActiveRecord::Migration[5.2]
  def change
    add_reference :test_passages, :current_question, foreign_key: { to_table: :questions }
    add_reference :test_passages, :question, foreign_key: { to_table: :questions }
    add_reference :questions, :test_passage, foreign_key: { to_table: :test_passages }
    rename_column :test_passages, :points, :correct_questions
  end
end
