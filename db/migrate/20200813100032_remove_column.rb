class RemoveColumn < ActiveRecord::Migration[6.0]
  def change
    remove_column :line_items, :quantity, :integer
    add_column :line_items,:quantity,:integer,default: 1
  end
end
