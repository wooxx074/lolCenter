class Match < ActiveRecord::Base
  belongs_to :player
  validates :user_id, presence: true
end
