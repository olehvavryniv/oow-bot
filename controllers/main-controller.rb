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
    statuses = 'Нікого онлайн' if statuses.empty?
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

  def learn_position!(*)
    position = ::CsPositionsService.instance.random_position
    File.open(position[:image]) do |photo|
      respond_with :photo, photo: photo, caption: "#{position[:map]} — #{position[:names].join(' / ')}"
    end
  end

  def random_position!(*)
    question = ::CsPositionsService.instance.new_question
    File.open(question[:image]) do |photo|
      respond_with :photo, photo: photo,
                   caption: 'What is the name of this position?',
                   reply_markup: question[:keyboard]
    end
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

  def random_position_callback_query(data, *)
    index, chosen = data.split(':', 2)
    result = ::CsPositionsService.instance.check(index, chosen)
    answer_callback_query(result[:correct] ? 'Correct' : 'Nope')

    caption = if result[:correct]
                "✅Correct! This position is called <b><i>#{result[:names]}</i></b>"
              else
                "❌#{LOH_NAMES.sample.capitalize}! This position is called <b><i>#{result[:names]}</i></b>"
              end
    edit_message :caption, caption: caption, parse_mode: 'HTML', reply_markup: { inline_keyboard: [] }
  rescue Telegram::Bot::Error => e
    # ve
  end
end
