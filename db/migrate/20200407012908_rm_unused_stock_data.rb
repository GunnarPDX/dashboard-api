class RmUnusedStockData < ActiveRecord::Migration[6.0]
  def change
    remove_column :assets, :spy1w
    remove_column :assets, :spy1y
    remove_column :assets, :btc1w
    remove_column :assets, :btc1y
  end
end
