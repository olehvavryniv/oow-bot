require './constants.rb'
require './wrappers/stratz-wrapper.rb'

class LastGamesService
  ID_FILE_NAME = 'last-match-id.txt'

  def initialize
    @oow_accounts = OOW_TEAM.map { |tm| tm[:steam_account_id] }
  end

  def process_last_games
    api_wrapper = StratzWrapper.new
    all_matches = api_wrapper.get_matches(get_last_match_id)

    return if all_matches.length == 0

    matches = all_matches.uniq { |m| m.id }
    matches.each { |match| publish_match_info(match) }

    write_last_match_id(matches.max_by { |m| m.id }.id)
  end

  private

  def get_last_match_id
    unless File.exist?(ID_FILE_NAME)
      File.write(ID_FILE_NAME, '0')
    end

    File.read(ID_FILE_NAME).to_i
  end

  def write_last_match_id(id)
    File.write(ID_FILE_NAME, id)
  end

  def publish_match_info(match)
    oow_players = match.players.filter { |p| @oow_accounts.include?(p.steam_account_id) }
    is_victory = oow_players[0].is_victory
    message = "#{is_victory ? '👍' : '👎' } #{is_victory ? WIN_PHRASES.sample : LOSE_PHRASES.sample}\n\n"


    mvp_name, core_name, support_name = mvp_players(oow_players)
    message += "👑 #{mvp_name} - MVP\n" if mvp_name
    message += "🏹 #{core_name} - Top Core\n" if core_name
    message += "🛡 #{support_name} - Top Support\n" if support_name
    message += "\n" if [mvp_name, core_name, support_name].any?

    oow_players.each do |oow_player|
      name = oow_player.steam_account.name
      hero_name = oow_player.hero.display_name
      k = oow_player.kills
      d = oow_player.deaths
      a = oow_player.assists
      imp = oow_player.imp
      message += "🔹 #{name} - #{hero_name} (⚔️#{k}/#{d}/#{a} 💪#{imp})\n"
    end

    OowBot.instance.bot.send_message(chat_id: ENV.fetch('MATCH_RESULTS_CHAT_ID'), text: message)
  end

  def mvp_players(players)
    [
      players.find { |p| p.award == 1 }&.steam_account&.name,
      players.find { |p| p.award == 2 }&.steam_account&.name,
      players.find { |p| p.award == 3 }&.steam_account&.name
    ]
  end
end

