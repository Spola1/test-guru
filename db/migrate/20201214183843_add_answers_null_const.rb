class AddAnswersNullConst < ActiveRecord::Migration[5.2]
  def change
    change_column_null(:answers, :answer, false)
  end
end
