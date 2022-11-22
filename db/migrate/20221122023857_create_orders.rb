class CreateOrders < ActiveRecord::Migration[7.0]
  def change
    create_table :orders do |t|
      t.decimal :amount, precision: 12, scale: 2
      t.string :serial_number
      t.references :user
      t.string :state
      t.timestamps
    end
  end
end
