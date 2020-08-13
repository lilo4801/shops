class AddColumnToBooks < ActiveRecord::Migration[6.0]
  def change
    add_column :books,:user_id,:integer
    add_column :books,:image,:string
  end
end
