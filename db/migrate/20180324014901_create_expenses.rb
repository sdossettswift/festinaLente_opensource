class CreateExpenses < ActiveRecord::Migration[5.0]
  def up
    create_table :expenses do |t|
      t.integer "project_id"
      t.integer "user_id"
      t.datetime "date"
      t.string "description"
      t.integer "mileage"
      t.boolean "reimburseable"
      t.float "amount"
      t.string "vendor"
      t.timestamps
    end
    add_index("expenses", "project_id")
    add_index("expenses", "user_id")
  end

  def down
    drop_table :expenses
  end
end
