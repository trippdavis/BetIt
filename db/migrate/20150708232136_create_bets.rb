class CreateBets < ActiveRecord::Migration
  def change
    create_table :bets do |t|
      t.string :title, null: false
      t.text :description, null: false
      t.integer :bet_taker, null: false
      t.integer :max_bets, null: false
      t.boolean :completed, null: false

      t.timestamps null: false
    end
    add_index :bets, :bet_taker
  end
end
