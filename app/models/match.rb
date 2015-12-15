class Match < ActiveRecord::Base
  belongs_to :player
  validates :player_id, presence: true
  validates :matchId, presence: true
  validates_uniqueness_of :matchId, :message => "Match has already been logged."
end
