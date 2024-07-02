module ApplicationHelper
  def system_result(player_result)
    return 'ties' if player_result == 'TIED'
    return 'loses' if player_result == 'WON'
    'wins'
  end
end
