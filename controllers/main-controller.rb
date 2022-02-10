# frozen_string_literal: true

require './services/steam-service.rb'
require './services/shotam-service.rb'
require './services/open_dota_service.rb'
require './services/last-games-sevice.rb'
require './constants.rb'

class MainController < Telegram::Bot::UpdatesController
  include CallbackQueryContext

  def steam!(*)
    statuses = ::SteamService.new.oow_statuses.map { |d| "#{d[:name]} - #{d[:status]}" }.join("\n")
    respond_with :message, text: statuses
  end

  def shosh!(*)
    respond_with :message, text: SHOSHES.sample
  end

  def random!(*)
    respond_with :message, text: ::OpenDotaService.new.random_hero
  end

  def shotam!(*)
    service = ::ShotamService.instance
    (message_text, reply_markup) = service.generate_message
    message = respond_with :message, text: message_text, reply_markup: reply_markup
    ShotamService.instance.last_messages[message['result']['chat']['id']] = message['result']['message_id']
  end

  def test!(*)
    puts chat['id']
  end

  def ready_callback_query(time = nil, *)
    ::ShotamService.instance.set_ready_info(from, time)
    answer_callback_query('Ok')
  rescue Telegram::Bot::Error => e
    # pofig
  end
end
