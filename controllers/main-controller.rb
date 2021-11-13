# frozen_string_literal: true

require './services/steam-service.rb'

class MainController < Telegram::Bot::UpdatesController

  SHOSHES = [
    'мне чуть стекла не разбились',
    'ну отец то ясно цего 2 труп по скайпу будет сидеть',
    'я это сегодня черный член',
    'у меня теперь 4 глаза не могут фокусироваться',
    'Случайно локтем комп вырубил',
    'Mor 6bl u 4To To JIy4IIIe cni3DaHyYb',
    'продался отписка контент не тот'
  ]

  def steam!(*)
    statuses = SteamService.new.oow_statuses.map { |d| "#{d[:name]} - #{d[:status]}" }.join("\n")
    respond_with :message, text: statuses
  end

  def shosh!(*)
    respond_with :message, text: SHOSHES.sample
  end
end
