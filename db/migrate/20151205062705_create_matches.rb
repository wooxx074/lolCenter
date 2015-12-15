class CreateMatches < ActiveRecord::Migration
  def change
    create_table :matches do |t|
      t.text :contentexit
      
      t.references :player, index: true, foreign_key: true

      t.timestamps null: false
    end
    add_index :matches, [:player_id, :created_at]
  end
end
