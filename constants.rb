# frozen_string_literal: true

OOW_TEAM = [
  { name: 'Олег', steam_id: '76561198070904318', steam_account_id: 110638590 },
  { name: 'Тарас', steam_id: '76561198040076918', steam_account_id: 79811190 },
  { name: 'Коля', steam_id: '76561198073694987', steam_account_id: 113429259 },
  { name: 'Ярік', steam_id: '76561198035221577', steam_account_id: 74955849 },
  { name: 'Ден', steam_id: '76561198076298358', steam_account_id: 116032630 },
  { name: 'Шеня', steam_id: '76561198059940772', steam_account_id: 99675044 },
  { name: 'Данк', steam_id: '76561198068523271', steam_account_id: 108257543 },
  { name: 'Посік', steam_id: '76561198027124455', steam_account_id: 66858727 },
  { name: 'Влад', steam_id: '76561198914888395', steam_account_id: 954622667 },
  { name: 'Юра', steam_id: '76561198048275645', steam_account_id: 88009917 },
  { name: 'Петро', steam_id: '76561198369308194', steam_account_id: 409042466 },
].freeze

STEAM_GAMES = {
  570 => 'Dota2',
  730 => 'CS:GO',
  578080 => 'PUBG'
}

SHOSHES = [
    'мне чуть стекла не разбились',
    'ну отец то ясно цего 2 труп по скайпу будет сидеть',
    'я это сегодня черный член',
    'у меня теперь 4 глаза не могут фокусироваться',
    'Случайно локтем комп вырубил',
    'Mor 6bl u 4To To JIy4IIIe cni3DaHyYb',
    'продался отписка контент не тот'
  ]
CS_POSITIONS = {
  "images/overpass/b_site_water.webp" => { "Overpass" => ["Water", "B-site Water", "Backplant"] },
  "images/overpass/a-default.webp" => { "Overpass" => ["A Default"] },
  "images/overpass/overpass_a_default.webp" => { "Overpass" => ["A Default"] },
  "images/overpass/a-long.webp" => { "Overpass" => ["A Long", "Long"] },
  "images/overpass/a-short.webp" => { "Overpass" => ["A Short"] },
  "images/overpass/abc_jungle.webp" => { "Overpass" => ["ABC", "Jungle"] },
  "images/overpass/b-default.webp" => { "Overpass" => ["B Default"] },
  "images/overpass/b-short.webp" => { "Overpass" => ["B Short"] },
  "images/overpass/back_monster.webp" => { "Overpass" => ["Back Monster"] },
  "images/overpass/bank.webp" => { "Overpass" => ["Bank"] },
  "images/overpass/barrels.webp" => { "Overpass" => ["Barrels", "Toxic"] },
  "images/overpass/bot-connector.webp" => { "Overpass" => ["Bot Connector", "Bot Con"] },
  "images/overpass/bridge.webp" => { "Overpass" => ["Bridge"] },
  "images/overpass/club.webp" => { "Overpass" => ["Club"] },
  "images/overpass/ct.webp" => { "Overpass" => ["CT"] },
  "images/overpass/dildo.webp" => { "Overpass" => ["Dildo", "Pillar"] },
  "images/overpass/divider.webp" => { "Overpass" => ["Divider"] },
  "images/overpass/fountain.webp" => { "Overpass" => ["Fountain", "Mid"] },
  "images/overpass/headshot-retake.webp" => { "Overpass" => ["Headshot Retake"] },
  "images/overpass/headshot.webp" => { "Overpass" => ["Headshot"] },
  "images/overpass/heaven.webp" => { "Overpass" => ["Heaven"] },
  "images/overpass/long-toilets.webp" => { "Overpass" => ["Long Toilets"] },
  "images/overpass/lower_tunnel.webp" => { "Overpass" => ["Lower Tunnel", "Underpass"] },
  "images/overpass/monster.webp" => { "Overpass" => ["Monster"] },
  "images/overpass/olof_corner.webp" => { "Overpass" => ["Olof", "Corner", "Olof Corner"] },
  "images/overpass/party.webp" => { "Overpass" => ["Party", "Baloons"] },
  "images/overpass/playground.webp" => { "Overpass" => ["Playground"] },
  "images/overpass/ramp.webp" => { "Overpass" => ["Ramp"] },
  "images/overpass/rock.webp" => { "Overpass" => ["Rock"] },
  "images/overpass/sandbags.webp" => { "Overpass" => ["Sandbags", "Bags"] },
  "images/overpass/short_area.webp" => { "Overpass" => ["Short Area"] },
  "images/overpass/short_pipe.webp" => { "Overpass" => ["Short Pipe"] },
  "images/overpass/t stairs.webp" => { "Overpass" => ["T Stairs"] },
  "images/overpass/toilets.webp" => { "Overpass" => ["Toilets"] },
  "images/overpass/top-connector.webp" => { "Overpass" => ["Top Connector", "Top Con"] },
  "images/overpass/tree.webp" => { "Overpass" => ["Tree"] },
  "images/overpass/truck.webp" => { "Overpass" => ["Truck"] },

  "images/inferno/short.webp" => { "Inferno" => ["Short"] },
  "images/inferno/stairs.webp" => { "Inferno" => ["Stairs"] },
  "images/inferno/a_backsite.webp" => { "Inferno" => ["A Backsite"] },
  "images/inferno/a-default.webp" => { "Inferno" => ["A Default"] },
  "images/inferno/arch.webp" => { "Inferno" => ["Arch"] },
  "images/inferno/b-1.webp" => { "Inferno" => ["B 1"] },
  "images/inferno/b-2.webp" => { "Inferno" => ["B 2"] },
  "images/inferno/balcony.webp" => { "Inferno" => ["Balcony"] },
  "images/inferno/bedroom.webp" => { "Inferno" => ["Bedroom"] },
  "images/inferno/boiler.webp" => { "Inferno" => ["Boiler"] },
  "images/inferno/brackets.webp" => { "Inferno" => ["Brackets", "Top Mid"] },
  "images/inferno/bridge.webp" => { "Inferno" => ["Bridge"] },
  "images/inferno/car.webp" => { "Inferno" => ["Car", "Top Banana"] },
  "images/inferno/close_left.webp" => { "Inferno" => ["Close Left"] },
  "images/inferno/coffins.webp" => { "Inferno" => ["Coffins"] },
  "images/inferno/dark.webp" => { "Inferno" => ["Dark"] },
  "images/inferno/fountain.webp" => { "Inferno" => ["Fountain"] },
  "images/inferno/graveyard.webp" => { "Inferno" => ["Graveyard"] },
  "images/inferno/half_wall.webp" => { "Inferno" => ["Half Wall"] },
  "images/inferno/halls.webp" => { "Inferno" => ["Halls"] },
  "images/inferno/library.webp" => { "Inferno" => ["Library"] },
  "images/inferno/logs.webp" => { "Inferno" => ["Logs"] },
  "images/inferno/long_corner.webp" => { "Inferno" => ["Long Corner", "Cubby"] },
  "images/inferno/long.webp" => { "Inferno" => ["Long"] },
  "images/inferno/mini_pit.webp" => { "Inferno" => ["Mini Pit"] },
  "images/inferno/newbox.webp" => { "Inferno" => ["New Box", "B 3"] },
  "images/inferno/pit.webp" => { "Inferno" => ["Pit"] },
  "images/inferno/pool.webp" => { "Inferno" => ["Pool"] },
  "images/inferno/porch.webp" => { "Inferno" => ["Porch"] },
  "images/inferno/ramp.webp" => { "Inferno" => ["Ramp"] },
  "images/inferno/sandbags.webp" => { "Inferno" => ["Sandbags"] },
}

LOH_NAMES = %w[лох пітух анскіл ретард сракабанька пітушара лошара дцп рак підар токсік]
LOH_GAMES = ['Якась діч', 'В якійсь хєрні', 'Дрочить', '🐁']

WIN_PHRASES = ['Вітаю шановні', 'Віннер віннер чікен діннер', 'Ізі гейм', 'Ізі брізі']
LOSE_PHRASES = ['Мінус єбала', 'Не витащили', 'Спробуйте ще', 'Спробуйте іншу гру']
