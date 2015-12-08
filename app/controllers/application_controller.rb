class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

    #variables for nav bar teams
    before_filter :set_teams
    def set_teams
    @teams = Team.all.sort_by{|tm| [tm.region, tm.name]}
    end
  def self.summInfo
    require 'net/http'
    require 'json'
    
    summonerID = 'C9Sneaky'
    url = 'https://na.api.pvp.net/api/lol/na/v1.4/summoner/by-name/'+summonerID+'?api_key=339b64ce-307b-441e-a4b6-f795401550cgit7'
    
    uri = URI(url)
    response = Net::HTTP.get(uri)
    summInfo = JSON.parse(response, :symbolize_names => true)
    puts summInfo
    puts summInfo[summonerID.downcase.to_sym][:id]
    
    #pull matches from summonerID /api/lol/{region}/v1.3/game/by-summoner/{summonerId}/recent
    matchUrl = 'https://na.api.pvp.net/api/lol/na/v2.2/matchlist/by-summoner/'+summInfo[summonerID.downcase.to_sym][:id].to_s+'?beginIndex=0&endIndex=5&api_key=339b64ce-307b-441e-a4b6-f795401550c7'
    matchUri = URI(matchUrl)
    matchResponse = Net::HTTP.get(matchUri)
    matchInfo = JSON.pretty_generate(JSON.parse(matchResponse, :symbolize_names => true))
    puts matchInfo
    
    
    

  #   # http://ruby-doc.org/stdlib-2.0.0/libdoc/open-uri/rdoc/OpenURI.html 
  #   require 'open-uri'
  #   # https://github.com/flori/json
  #   require 'json'
  #   # http://stackoverflow.com/questions/9008847/what-is-difference-between-p-and-pp
  #   require 'pp'
  #   #request riot URL
  #   summonerID = 'Funkytastic'
  #   request_uri = 'https://na.api.pvp.net/api/lol/na/v1.4/summoner/by-name/'+summonerID+'?api_key=339b64ce-307b-441e-a4b6-f795401550c7'
    
  #   url = request_uri
    
  #   buffer = open(url).read
  #   result = JSON.pretty_generate(JSON.parse(buffer))
  #   puts result
  #   # result.each do |key, value|
  #   #   puts  "#{key}:#{value}"
  #   # end
  # puts result["funkytastic"["id"]]
  end
end
