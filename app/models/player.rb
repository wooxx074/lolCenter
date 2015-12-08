class Player < ActiveRecord::Base
  has_many :matches, dependent: :destroy
  belongs_to :team
  validates :name, presence: true, uniqueness: { case_sensitive: false }
  serialize :accounts
  validates :team_id, presence: true
  
end
