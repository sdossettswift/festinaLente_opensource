class CreateTimesheets < ActiveRecord::Migration[5.0]
  def up
    create_table :timesheets do |t|
      t.integer :user_id
      t.string :status
      t.boolean :submitted
      t.date :start_date
      t.date :end_date
      t.datetime :time_submitted

      t.timestamps
    end
    add_index :timesheets, :user_id

  end

  def down
    drop_table :timesheets
  end
end
