class AddColToOrders < ActiveRecord::Migration[6.0]
  def change
    add_column :orders, :address,:string
    add_column :orders, :phone,:decimal
    add_column :orders, :description,:string
    add_column :orders, :price,:decimal
    add_column :orders, :status,:string
    add_column :orders, :user_id,:integer
  end
end
