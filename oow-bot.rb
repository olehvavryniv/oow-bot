# frozen_string_literal: true

require 'singleton'
require 'telegram/bot'
require 'logger'
require './controllers/main-controller.rb'
require 'dotenv'
require 'byebug'
require 'graphlient'

Dotenv.load

class OowBot
  include ::Singleton

  attr_reader :bot

  def initialize
    @bot = ::Telegram::Bot::Client.new(ENV.fetch('TELEGRAM_API_TOKEN'), ENV.fetch('TELEGRAM_BOT_NICKNAME'))
    ::Steam.apikey = ENV.fetch('STEAM_API_KEY')
  end

  def launch
    logger = Logger.new(STDOUT)
    @poller = ::Telegram::Bot::UpdatesPoller.new(@bot, MainController, logger: logger)
    @poller.start
  end
end

Thread.new do
  while true do
    sleep 60
    ::ShotamService.instance.sanitize_info
  end
end

Thread.new do
  while true do
    begin
      sleep 60 * 1
      ::LastGamesService.new.process_last_games
    rescue
      # pofig
    end
  end
end

OowBot.instance.launch
