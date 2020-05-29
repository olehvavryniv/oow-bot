# frozen_string_literal: true

require 'steam-api'
require './constants.rb'

class SteamService
  def oow_statuses
    OOW_TEAM.map do |member|
      steam_data = Steam::User.summary(member[:steam_id])
      { name: steam_data['personaname'], status: humanize_status(steam_data['personastate'], steam_data['gameid']) }
    end
  end

  private

  def humanize_status(status_id, game_id)
    case status_id
    when 0
      'Оффлайн'
    when 1
      'Онлайн' unless game_id
      STEAM_GAMES[game_id.to_i]
    else
      'Спить'
    end
  end
end
