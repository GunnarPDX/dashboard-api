class UpdateStocks < ActiveRecord::Migration[6.0]
  def change
    add_column :assets, :spy1w, :string
    add_column :assets, :spy1m, :string
    add_column :assets, :spy1y, :string
    add_column :assets, :btc1w, :string
    add_column :assets, :btc1m, :string
    add_column :assets, :btc1y, :string
  end
end
