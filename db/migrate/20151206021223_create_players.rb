class CreatePlayers < ActiveRecord::Migration
  def change
    create_table :players do |t|
      t.string :name
      t.string :position
      t.string :league
      t.string :accounts
      t.string :stream

      t.timestamps null: false
    end
    
    add_index :players, [:teamid, :created_at]
    t.references :teamid
  end
end
