# Model contains the following attrs:
# t.string :name
# t.timestamps

class Player < ActiveRecord::Base
  has_many :games, foreign_key: 'player_1_id'
end
