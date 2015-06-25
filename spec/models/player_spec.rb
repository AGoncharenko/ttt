require 'spec_helper'

describe Player do
  describe "dependencies" do
    it { should have_many(:games).with_foreign_key('player_1_id') }
  end

end
