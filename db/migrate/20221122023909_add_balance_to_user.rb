class AddBalanceToUser < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :balance, :decimal, precision: 18, scale: 2, default: 0
  end
end
