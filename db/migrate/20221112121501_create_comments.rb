class CreateComments < ActiveRecord::Migration[7.0]
  def change
    create_table :comments do |t|
      t.string :content
      t.references :post
      t.references :user
      t.timestamps
    end
  end
end
