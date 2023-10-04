# frozen_string_literal: true

require './services/steam-service.rb'
require './services/shotam-service.rb'
require './services/open_dota_service.rb'
require './services/last-games-sevice.rb'
require './constants.rb'

class MainController < Telegram::Bot::UpdatesController
  @@message = nil
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
    position_key = CS_POSITIONS.to_a.sample.first
    position_names = CS_POSITIONS[position_key].values.join(", ")
    respond_with :photo, photo: File.open(position_key), caption: position_names
  end

  def random_position!(*)
    @@message = nil
    position_key = CS_POSITIONS.to_a.sample.first
    correct_names = CS_POSITIONS[position_key].values.first
    map = CS_POSITIONS[position_key].keys[0]
    given_map_positions = CS_POSITIONS.select {|k, v| v.keys.first == map }
    #remove correct name from the list
    given_map_positions.delete(position_key)
    wrong_names = []
    given_map_positions.values.each do |i|
      wrong_names << i[map].flatten
    end
    correct_answer = correct_names.sample
    formatted_array =  (wrong_names.flatten.first(2) << correct_answer).shuffle

    bot.send_photo(chat_id: chat['id'], photo: File.open(position_key), caption: "What is the name of this position?")
    answers =
      {
        inline_keyboard: [
          [
            { text: "#{formatted_array[0]}", callback_data: "random_position:#{formatted_array[0]}/#{correct_answer}" },
          ],
          [
            { text: "#{formatted_array[1]}", callback_data: "random_position:#{formatted_array[1]}/#{correct_answer}" },
          ],
          [
            { text: "#{formatted_array[2]}", callback_data: "random_position:#{formatted_array[2]}/#{correct_answer}" },
          ],
        ]
      }
    respond_with :message, text: "Choose one:", reply_markup: answers
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
    # unreal kostilyaka
    return if @@message
    status = (answer.split('/').uniq.length == 1)
    text = status ? "✅Correct! This position is called <b><i>#{answer.split('/').first}</i></b>" : "❌#{LOH_NAMES.sample.capitalize}! This position is called <b><i>#{answer.split('/').last}</i></b>"
    @@message = bot.send_message(chat_id: chat['id'], text: text, parse_mode: "HTML")
  rescue Telegram::Bot::Error => e
    # ve
  end
end
