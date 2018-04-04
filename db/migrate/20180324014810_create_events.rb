class CreateEvents < ActiveRecord::Migration[5.0]
  def up
    create_table :events do |t|
      t.datetime "start"
      t.datetime "end"
      t.string "phase"
      t.integer "user_id"
      t.integer "project_id"
      t.string "color"
      t.string "title"
      t.timestamps
    end
    add_index("events", "project_id")
    add_index("events", "user_id")
  end

  def down
    drop_table :events
  end

end
