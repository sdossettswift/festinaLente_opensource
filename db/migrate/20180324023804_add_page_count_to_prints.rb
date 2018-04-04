class AddPageCountToPrints < ActiveRecord::Migration[5.0]
  def up
      add_column :prints, :page_count, :integer
  end

  def down
      remove_column :prints, :page_count
  end
end
