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
    
    add_index :players, [:team_id, :created_at]
  end
end
