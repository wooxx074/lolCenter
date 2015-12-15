class Player < ActiveRecord::Base
  belongs_to :team,  :foreign_key => :teamid, :primary_key => :teamid
  has_many :matches, dependent: :destroy
  validates :name, presence: true, uniqueness: { case_sensitive: false }
  serialize :accounts
  validates :teamid, presence: true
  
  def matchGenerate
    require 'net/http'
    require 'json'
    
    #versioning variables
    matchlist_vers = "v2.2"
    akey = '339b64ce-307b-441e-a4b6-f795401550c7'
    id = self.id
    
    self.accounts.each do |key, value|
      
      
      #pull matches from summonerID /api/lol/{region}/v1.3/game/by-summoner/{summonerId}/recent
      matchUrl = 'https://na.api.pvp.net/api/lol/na/'+ matchlist_vers +'/matchlist/by-summoner/'+ value +'?beginIndex=0&endIndex=5&api_key='+akey
      matchUri = URI(matchUrl)
      matchResponse = Net::HTTP.get(matchUri)
      matchInfo = ActiveSupport::JSON.decode(matchResponse)
      matchNum = 0
      
      
        5.times do
          begin
            matchInfoId = matchInfo["matches"][matchNum]["matchId"]
          
            newMatchData = Match.create(content: matchInfo, player_id: id, matchId: matchInfoId)
            
            puts "#{newMatchData.matchId} successfully recorded"
            matchNum += 1
          rescue Exception => e
            puts e.message
            puts e.backtrace.inspect
            next
          end
       end

      
      
      puts JSON.pretty_generate(matchInfo)
      
      
    

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
  
end
