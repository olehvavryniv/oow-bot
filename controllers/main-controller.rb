# frozen_string_literal: true

require './services/steam-service.rb'

class MainController < Telegram::Bot::UpdatesController
  def message(message)
    respond_with :message, message
  end

  def steam!(*)
    statuses = SteamService.new.oow_statuses.map { |d| "#{d[:name]} - #{d[:status]}" }.join("\n")
    respond_with :message, text: statuses
  end

  def shosh!(*)
    respond_with :message, text: 'az'
  end
end
