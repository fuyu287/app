class AddPriceNameToBooks < ActiveRecord::Migration[6.1]
  def change
    add_column :books, :price, :integer
  end
end
