class CreatePlacedBets < ActiveRecord::Migration
  def change
    create_table :placed_bets do |t|
      t.integer :user_id, null: false
      t.integer :bet_id, null: false

      t.timestamps null: false
    end
    add_index :placed_bets, :user_id
    add_index :placed_bets, :bet_id
  end
end
