class ChangeColumnInGames < ActiveRecord::Migration[5.1]
  def self.up
    change_column :games, :price, :decimal, precision: 5, scale: 2
  end
  def self.down
    change_column :games, :price, :integer
  end
end
