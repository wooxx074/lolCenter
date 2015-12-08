class TeamsController < ApplicationController
  def index

  end

  def show
    @teamName = Team.find_by(name: params[:name])
  end
  
  
  def league
    
  end
end
