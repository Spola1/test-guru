class AddNullConstant < ActiveRecord::Migration[5.2]
  def change
    change_column_null(:tests, :title, false)
    change_column_null(:questions, :body, false)
    change_column_null(:categories, :title, false)
  end
end
