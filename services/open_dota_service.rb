# frozen_string_literal: true

require 'open_dota_api'
require './constants.rb'

class OpenDotaService

  def random_hero
    OpenDotaApi.heroes.random.localized_name
  end
end
