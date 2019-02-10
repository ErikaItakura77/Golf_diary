class AddPuttBackNineToRounds < ActiveRecord::Migration[5.0]
  def change
    add_column :rounds, :putt_back_nine, :integer
    add_column :rounds, :add_nine, :integer
  end
end
