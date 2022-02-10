

class StratzWrapper
  MAX_PLAYERS_LIMIT = 5

  def initialize
    @client = ::Graphlient::Client.new(
      'https://api.stratz.com/graphql',
      headers: {
        'Authorization' => "Bearer #{ENV.fetch('STRATZ_API_KEY')}"
      },
      http_options: {
        read_timeout: 20,
        write_timeout: 30
      }
    )
  end

  def get_matches(last_match_id)
    steam_ids = OOW_TEAM.map { |tm| tm[:steam_account_id] }
    result = []
    steam_ids.each_slice(MAX_PLAYERS_LIMIT) do |ids_slice|
      response = @client.query(matches_query, { steam_ids: ids_slice, last_match_id: last_match_id })
      result.concat(response.data.players.map { |p| p.matches }.flatten)
    end
    result
  end

  private

  def matches_query
    query = <<-GRAPHQL
      query($steam_ids: [Long]!, $last_match_id: Long) {
        players(steamAccountIds: $steam_ids) {
          matches(request: {take: 1, isParsed: true, isParty: true, after: $last_match_id}) {
            id
            didRadiantWin
            players {
              steamAccount {
                name
              }
              hero {
                displayName
              }
              imp
              kills
              deaths
              assists
              award
              isVictory
              steamAccountId
              isRadiant
            }
          }
        }
      }
    GRAPHQL
    query
  end
end
