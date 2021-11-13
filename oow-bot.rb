# frozen_string_literal: true

require 'telegram/bot'
require 'logger'
require './controllers/main-controller.rb'
require 'dotenv'

Dotenv.load

class OowBot
  include Singleton

  def initialize
    @bot = Telegram::Bot::Client.new(ENV.fetch('TELEGRAM_API_TOKEN'), ENV.fetch('TELEGRAM_BOT_NICKNAME'))
    Steam.apikey = ENV.fetch('STEAM_API_KEY')
  end

  def launch
    logger = Logger.new(STDOUT)
    @poller = Telegram::Bot::UpdatesPoller.new(@bot, MainController, logger: logger)
    @poller.start
  end
end

OowBot.instance.launch
