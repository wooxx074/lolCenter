class TeamsController < ApplicationController

  def index

  end

  def show
    @teamName = Team.find_by_name(params[:name])
    @teamPlayer = @teamName.players.order("position")
    @teamLogo = "/team_icons/#{@teamName.region.tr(" ", "_")}/#{@teamName.name.tr(" ", "_").downcase}_logo.png"
    
    #player icons by position - for roster card
    #playerPosition array sorts positions in correct order. Currently in alphabetical order.
    @playerPosition = ["Jungle","Mid","AD Carry","Support","Substitute"]
    
    def to_param
     "#{@teamName.parameterize}"
    end

  end
  
  
  def league
    
  end
end
