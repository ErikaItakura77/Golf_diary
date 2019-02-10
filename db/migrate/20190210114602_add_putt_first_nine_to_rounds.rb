class AddPuttFirstNineToRounds < ActiveRecord::Migration[5.0]
  def change
    add_column :rounds, :putt_first_nine, :integer
  end
end
