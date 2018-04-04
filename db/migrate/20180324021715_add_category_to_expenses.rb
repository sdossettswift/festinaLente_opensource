class AddCategoryToExpenses < ActiveRecord::Migration[5.0]
  def up
      add_column :expenses, :category, :string
  end

  def down
      remove_column :expenses, :category
  end

end
