require 'spec_helper'

describe GameHelper do
  describe "#calc_result" do
    let!(:player_1) { create(:player, name: "Andrew") }
    let!(:player_2) { create(:player, name: "Ben") }

    let!(:game_1) { create(:game, player_1_id: player_1.id, player_2_id: player_2.id) }
    let!(:game_2) { create(:game, player_1_id: player_1.id, player_2_id: player_2.id, cells: {"cell_0"=>"X", "cell_1"=>"O", "cell_2"=>"", "cell_3"=>"O", "cell_4"=>"O", "cell_5"=>"O", "cell_6"=>"X", "cell_7"=>"", "cell_8"=>""}) }
    let!(:game_3) { create(:game, player_1_id: player_1.id, player_2_id: player_2.id, cells: {"cell_0"=>"X", "cell_1"=>"O", "cell_2"=>"X", "cell_3"=>"O", "cell_4"=>"X", "cell_5"=>"O", "cell_6"=>"O", "cell_7"=>"X", "cell_8"=>"O"}) }

    it "returns winner player_1" do
      calc = calc_result(game_1)
      calc[:result].should == 'Winner Andrew'
      calc[:winner].should == player_1.id
    end
    it "returns winner player_2" do
      calc = calc_result(game_2)
      calc[:result].should == 'Winner Ben'
      calc[:winner].should == player_2.id
    end
    it "returns draw" do
      calc = calc_result(game_3)
      calc[:result].should == 'Draw'
      calc[:winner].should == nil
    end
  end
end
