class AddAddressInPost < ActiveRecord::Migration[7.0]
  def change
    add_column :posts, :address, :string
    add_reference :posts, :address_region
    add_reference :posts, :address_province
  end
end
