class CreateProjects < ActiveRecord::Migration[5.0]
  def up
    create_table :projects do |t|
      t.integer "client_id"
      t.string "name"
      t.string "address1"
      t.string "address2"
      t.string "city"
      t.string "sate"
      t.string "zip"
      t.boolean "active"
      t.text "description"
      t.integer "square_footage"
      t.string "status"
      t.string "number"
    end
    add_index("projects", "client_id")
    add_index("projects", "name")
    add_index("projects", "number", :unique => true)
  end

  def down
    drop_table :projects
  end
end
