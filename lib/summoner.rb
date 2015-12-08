class Summoner < ApplicationController
    def self.summInfo
        # http://ruby-doc.org/stdlib-2.0.0/libdoc/open-uri/rdoc/OpenURI.html 
        require 'Summoner'
        require 'open-uri'
        # https://github.com/flori/json
        require 'json'
        # http://stackoverflow.com/questions/9008847/what-is-difference-between-p-and-pp
        require 'pp'
        #request riot URL
        summonerID = 'Funkytastic'
        request_uri = 'https://na.api.pvp.net/api/lol/na/v1.4/summoner/by-name/'+summonerID+'?api_key=339b64ce-307b-441e-a4b6-f795401550c7'
        
        url = request_uri
        
        buffer = open(url).read
        result = JSON.parse(buffer)
        puts result
  
  
    end
  end