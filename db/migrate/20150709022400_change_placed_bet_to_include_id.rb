class ChangePlacedBetToIncludeId < ActiveRecord::Migration
  def change
    rename_column :bets, :bet_taker, :bet_taker_id
  end
end
