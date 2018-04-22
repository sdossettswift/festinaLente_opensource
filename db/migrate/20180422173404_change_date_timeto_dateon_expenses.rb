class ChangeDateTimetoDateonExpenses < ActiveRecord::Migration[5.0]
  def change
      change_column :expenses, :date, :date
  end
end
