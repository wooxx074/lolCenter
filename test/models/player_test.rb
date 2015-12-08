require 'test_helper'

class PlayerTest < ActiveSupport::TestCase
  
  def setup
    @team = teams.all
    @player = @team.player.build(name:"Sneaky")
  end
  
  test "should be valid" do
    assert @player.valid?
  end
  
  test "team id should be present" do
    @player.team_id = nil
    assert_not @player.valid?
  end
end
