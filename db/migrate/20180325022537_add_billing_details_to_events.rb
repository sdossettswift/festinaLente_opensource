class AddBillingDetailsToEvents < ActiveRecord::Migration[5.0]
    def up
      add_column :events, :timesheet_id, :integer, :null => true
      add_column :events, :billed, :boolean, :default => false
      add_column :events, :submitted, :boolean, :default => false
    end

    def down
      remove_column :events, :timesheet_id
      remove_column :events, :billed
      remove_column :events, :submitted
    end
end
