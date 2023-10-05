# frozen_string_literal: true

require './services/steam-service.rb'
require './services/shotam-service.rb'
require './services/open_dota_service.rb'
require './services/last-games-sevice.rb'
require './constants.rb'
require './services/cs_positions_service.rb'

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

  def position!(*)
    position_key = ::CsPositionsService.new.generate_random_position_key
    position_names = CS_POSITIONS[position_key].values.join(", ")
    respond_with :photo, photo: File.open(position_key), caption: position_names
  end

  def random_position!(*)
    position_key = ::CsPositionsService.new.generate_random_position_key
    bot.send_photo(chat_id: chat['id'], photo: File.open(position_key), caption: "What is the name of this position?")
    answers = ::CsPositionsService.new.generate_answers_for_given_position(position_key)
    message = respond_with :message, text: "Choose one:", reply_markup: answers
    OowBot.redis.set('last_cs_position_message', message['result']['message_id'])
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

  def random_position_callback_query(answer, *)
    status = (answer.split('/').uniq.length == 1)
    text = status ? "✅Correct! This position is called <b><i>#{answer.split('/').first}</i></b>" : "❌#{LOH_NAMES.sample.capitalize}! This position is called <b><i>#{answer.split('/').last}</i></b>"
    message_id = OowBot.redis.get('last_cs_position_message')
    bot.edit_message_reply_markup(chat_id: chat['id'], message_id: message_id,reply_markup: {
      inline_keyboard: []
    })
    sleep(1)
    bot.edit_message_text(chat_id: chat['id'], message_id: message_id, text: text, parse_mode: "HTML")
  rescue Telegram::Bot::Error => e
    # ve
  end
end
