class PlayersController < ApplicationController
  def index
  end
  
  def show
    @playerName = Player.find_by(name: params[:playerName])
    @playerTeam = Team.find_by_teamid(@playerName.teamid)
  end
end
