class GamesController < ApplicationController
  include GameHelper

  def index
    session.delete(:player_id)
    session.delete(:game)
    @games = Game.where.not(result: nil)
  end

  def show
    @game = Game.find_by(id: params[:id])
    @user = current_user
    cond = @game.player_1_id.present? && @game.player_2_id.present? && (@game.player_1_id != @user.try(:id) && @game.player_2_id != @user.try(:id))
    #redirect user to games#index if game already has 2 players or it's finished
    if cond
      redirect_to games_path, notice: 'This Game already has 2 players.'
    elsif @game.finished
      redirect_to games_path, notice: 'This Game is finished.'
    end
  end

  def new
    game = Game.create()
    redirect_to game_path(game)
  end

  def update
    game = Game.find(params[:id])
    game.update(player_id_turn: params[:game][:player_id_turn], cells: params[:game][:cells])
    calc = calc_result(game)
    if calc[:result].present?
      game.update(finished: true, result: calc[:result])
    end
    render :json => { success: true, game: {player_id_turn: game.player_id_turn, cells: game.cells, finished: game.finished}}
  end

  # player_id and game data are saved into session not to ask user's name after games#show page refresh
  def save_user
    player = Player.create(name: event_params[:player_name])
    session[:player_id] = player.id
    game = Game.find_by(id: event_params[:id])
    if game.player_1_id.blank?
      game.update(player_1_id: player.id, player_id_turn: player.id)
      player = {role: 'player_first', name: player.name, id: player.id}
    elsif game.player_2_id.blank?
      game.update(player_2_id: player.id)
      player = {role: 'player_second', name: player.name, id: player.id}
    end
    session[:game] = {game_id: game.id, player: player}
    render :json => { success: true, player: player}
  end

  # this method is triggered every second to refresh the gameboard and players' info
  def trigger_game
    game = Game.find(params[:id])
    render :json => { success: true, game: {player_id_turn: game.player_id_turn, cells: game.cells, finished: game.finished},
                      player_first: {name: game.try(:player_first).try(:name), id: game.try(:player_first).try(:id)},
                      player_second: {name: game.try(:player_second).try(:name), id: game.try(:player_second).try(:id)},
                      user: {name: current_user.try(:name), id: current_user.try(:id)}
           }
  end

  private

  def event_params
    params.require(:game).permit(:player_name, :id, :cells, :player_id_turn)
  end
end
