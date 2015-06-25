module GameHelper

  # this method returns the hash result {result: 'string', winner: player.id} of the game in accordance to game.cells
  def calc_result(game)
  #   {"cell_0"=>"X", "cell_1"=>"", "cell_2"=>"", "cell_3"=>"", "cell_4"=>"", "cell_5"=>"", "cell_6"=>"", "cell_7"=>"", "cell_8"=>""}
    cells = game.cells
    result = ''
    winner = nil
    if win_condition(cells['cell_0'], cells['cell_1'], cells['cell_2'])
      if cells['cell_0'] == 'X'
        result = "Winner #{game.try(:player_first).try(:name)}"
        winner = game.try(:player_first).try(:id)
      else
        result = "Winner #{game.try(:player_second).try(:name)}"
        winner = game.try(:player_second).try(:id)
      end
    elsif win_condition(cells['cell_3'], cells['cell_4'], cells['cell_5'])
      if cells['cell_3'] == 'X'
        result = "Winner #{game.try(:player_first).try(:name)}"
        winner = game.try(:player_first).try(:id)
      else
        result = "Winner #{game.try(:player_second).try(:name)}"
        winner = game.try(:player_second).try(:id)
      end
    elsif win_condition(cells['cell_6'], cells['cell_7'], cells['cell_8'])
      if cells['cell_6'] == 'X'
        result = "Winner #{game.try(:player_first).try(:name)}"
        winner = game.try(:player_first).try(:id)
      else
        result = "Winner #{game.try(:player_second).try(:name)}"
        winner = game.try(:player_second).try(:id)
      end
    elsif win_condition(cells['cell_0'], cells['cell_3'], cells['cell_6'])
      if cells['cell_0'] == 'X'
        result = "Winner #{game.try(:player_first).try(:name)}"
        winner = game.try(:player_first).try(:id)
      else
        result = "Winner #{game.try(:player_second).try(:name)}"
        winner = game.try(:player_second).try(:id)
      end
    elsif win_condition(cells['cell_1'], cells['cell_4'], cells['cell_7'])
      if cells['cell_1'] == 'X'
        result = "Winner #{game.try(:player_first).try(:name)}"
        winner = game.try(:player_first).try(:id)
      else
        result = "Winner #{game.try(:player_second).try(:name)}"
        winner = game.try(:player_second).try(:id)
      end
    elsif win_condition(cells['cell_2'], cells['cell_5'], cells['cell_8'])
      if cells['cell_2'] == 'X'
        result = "Winner #{game.try(:player_first).try(:name)}"
        winner = game.try(:player_first).try(:id)
      else
        result = "Winner #{game.try(:player_second).try(:name)}"
        winner = game.try(:player_second).try(:id)
      end
    elsif win_condition(cells['cell_1'], cells['cell_4'], cells['cell_8'])
      if cells['cell_1'] == 'X'
        result = "Winner #{game.try(:player_first).try(:name)}"
        winner = game.try(:player_first).try(:id)
      else
        result = "Winner #{game.try(:player_second).try(:name)}"
        winner = game.try(:player_second).try(:id)
      end
    elsif win_condition(cells['cell_2'], cells['cell_4'], cells['cell_6'])
      if cells['cell_2'] == 'X'
        result = "Winner #{game.try(:player_first).try(:name)}"
        winner = game.try(:player_first).try(:id)
      else
        result = "Winner #{game.try(:player_second).try(:name)}"
        winner = game.try(:player_second).try(:id)
      end
    elsif cells['cell_0'].present? && cells['cell_1'].present? && cells['cell_2'].present? && cells['cell_3'].present? && cells['cell_4'].present? && cells['cell_5'].present? && cells['cell_6'].present? && cells['cell_7'].present? && cells['cell_8'].present?
      result = 'Draw'
    end
    return {result: result, winner: winner}
  end


 # this method returns true or false if cells matches
  def win_condition(cell_1, cell_2, cell_3)
    cell_1.present? && cell_2.present? && cell_3.present? && [cell_1, cell_2, cell_3].uniq.count == 1
  end
end
