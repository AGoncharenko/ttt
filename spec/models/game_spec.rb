require 'spec_helper'

describe Game do
  describe "dependencies" do
    it {should belong_to(:player_first)}
    it {should belong_to(:player_second)}
  end

end
