class CreateGames < ActiveRecord::Migration
  def up
    enable_extension :hstore

    create_table :games do |t|
      t.integer :player_1_id
      t.integer :player_2_id
      t.boolean :finished, :default => false
      t.string :result
      t.integer :player_id_turn
      t.hstore :cells, :default => {'cell_0' => '', 'cell_1' => '', 'cell_2' => '', 'cell_3' => '', 'cell_4' => '', 'cell_5' => '', 'cell_6' => '', 'cell_7' => '', 'cell_8' => ''}, null: false

      t.timestamps
    end
  end

  def down
    drop_table :games
    disable_extension :hstore
  end
end
