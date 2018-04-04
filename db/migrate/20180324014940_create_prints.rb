class CreatePrints < ActiveRecord::Migration[5.0]
  def up
    create_table :prints do |t|
      t.integer "project_id"
      t.integer "user_id"
      t.string "device"
      t.string "format"
      t.string "print_format"
      t.boolean "color"
      t.boolean "scan"
      t.float "cost"
      t.timestamps
    end
    add_index("prints", "project_id")
    add_index("prints", "user_id")
  end

  def down
    drop_table :prints
  end
end
