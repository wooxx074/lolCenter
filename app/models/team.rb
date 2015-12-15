class Team < ActiveRecord::Base
  has_many :players, :foreign_key => :teamid, :primary_key => :teamid
end
