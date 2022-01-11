# frozen_string_literal: true

require 'steam-api'
require './constants.rb'

class SteamService
  def oow_statuses
    OOW_TEAM.map do |member|
      steam_data = Steam::User.summary(member[:steam_id])
      if steam_data['personastate'] == 0
        nil
      else
        { name: steam_data['personaname'], status: humanize_status(steam_data['personastate'], steam_data['gameid']) }
      end
    end.reject(&:nil?)
  end

  private

  def humanize_status(status_id, game_id)
    case status_id
    when 0
      'Оффлайн'
    when 1
      game_id ? game_name_by_id(game_id.to_i) : 'Онлайн'
    else
      'Спить'
    end
  end

  def game_name_by_id(game_id)
    name = STEAM_GAMES[game_id.to_i]
    name = LOH_GAMES.sample unless name
    name
  end
end
