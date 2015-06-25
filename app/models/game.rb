# Model contains the following attrs:
# t.integer :player_1_id
# t.integer :player_2_id
# t.boolean :finished, :default => false
# t.string :result
# t.integer :player_id_turn
# t.hstore :cells, :default => {'cell_0' => '', 'cell_1' => '', 'cell_2' => '', 'cell_3' => '', 'cell_4' => '', 'cell_5' => '', 'cell_6' => '', 'cell_7' => '', 'cell_8' => ''}, null: false
# t.timestamps

class Game < ActiveRecord::Base
  store_accessor :cells

  belongs_to :player_first, class_name: 'Player', foreign_key: 'player_1_id'
  belongs_to :player_second, class_name: 'Player', foreign_key: 'player_2_id'

  attr_accessor :player_name
end
