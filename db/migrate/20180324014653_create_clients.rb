class CreateClients < ActiveRecord::Migration[5.0]
  def up
    create_table :clients do |t|
      t.string "name"
      t.string "last_name"
      t.string "first_name"
      t.timestamps
    end
  end
  def down
    drop_table :clients
  end
end
