class AddDateToPrints < ActiveRecord::Migration[5.0]
  def change
    add_column :prints, :date, :date
  end
end
