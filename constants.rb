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
  { name: 'Аліна', steam_id: '76561198081618425', steam_account_id: 121352697 },
  { name: 'Андрюха', steam_id: '76561198115329223', steam_account_id: 155063495 },
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
CS_POSITIONS = [
  { map: "Overpass", image: "images/overpass/b_site_water.webp",  names: ["Water", "B-site Water", "Backplant"] },
  { map: "Overpass", image: "images/overpass/a-default.webp",     names: ["A Default"] },
  { map: "Overpass", image: "images/overpass/a-long.webp",        names: ["A Long", "Long"] },
  { map: "Overpass", image: "images/overpass/a-short.webp",       names: ["A Short"] },
  { map: "Overpass", image: "images/overpass/abc_jungle.webp",    names: ["ABC", "Jungle"] },
  { map: "Overpass", image: "images/overpass/b-default.webp",     names: ["B Default"] },
  { map: "Overpass", image: "images/overpass/b-short.webp",       names: ["B Short"] },
  { map: "Overpass", image: "images/overpass/back_monster.webp",  names: ["Back Monster"] },
  { map: "Overpass", image: "images/overpass/bank.webp",          names: ["Bank"] },
  { map: "Overpass", image: "images/overpass/barrels.webp",       names: ["Barrels", "Toxic"] },
  { map: "Overpass", image: "images/overpass/bot-connector.webp", names: ["Bot Connector", "Bot Con"] },
  { map: "Overpass", image: "images/overpass/bridge.webp",        names: ["Bridge"] },
  { map: "Overpass", image: "images/overpass/club.webp",          names: ["Club"] },
  { map: "Overpass", image: "images/overpass/ct.webp",            names: ["CT"] },
  { map: "Overpass", image: "images/overpass/dildo.webp",         names: ["Dildo", "Pillar"] },
  { map: "Overpass", image: "images/overpass/divider.webp",       names: ["Divider"] },
  { map: "Overpass", image: "images/overpass/fountain.webp",      names: ["Fountain", "Mid"] },
  { map: "Overpass", image: "images/overpass/headshot.webp",      names: ["Headshot"] },
  { map: "Overpass", image: "images/overpass/dumpster.webp",      names: ["Dumpster"] },
  { map: "Overpass", image: "images/overpass/heaven.webp",        names: ["Heaven"] },
  { map: "Overpass", image: "images/overpass/long-toilets.webp",  names: ["Long Toilets"] },
  { map: "Overpass", image: "images/overpass/lower_tunnel.webp",  names: ["Lower Tunnel", "Underpass"] },
  { map: "Overpass", image: "images/overpass/monster.webp",       names: ["Monster"] },
  { map: "Overpass", image: "images/overpass/olof_corner.webp",   names: ["Olof", "Corner", "Olof Corner"] },
  { map: "Overpass", image: "images/overpass/party.webp",         names: ["Party", "Baloons"] },
  { map: "Overpass", image: "images/overpass/playground.webp",    names: ["Playground"] },
  { map: "Overpass", image: "images/overpass/ramp.webp",          names: ["Ramp"] },
  { map: "Overpass", image: "images/overpass/rock.webp",          names: ["Rock"] },
  { map: "Overpass", image: "images/overpass/sandbags.webp",      names: ["Sandbags", "Bags"] },
  { map: "Overpass", image: "images/overpass/short_area.webp",    names: ["Short Area"] },
  { map: "Overpass", image: "images/overpass/short_pipe.webp",    names: ["Short Pipe"] },
  { map: "Overpass", image: "images/overpass/t-stairs.webp",      names: ["T Stairs"] },
  { map: "Overpass", image: "images/overpass/toilets.webp",       names: ["Toilets"] },
  { map: "Overpass", image: "images/overpass/top-connector.webp", names: ["Top Connector", "Top Con"] },
  { map: "Overpass", image: "images/overpass/tree.webp",          names: ["Tree"] },
  { map: "Overpass", image: "images/overpass/truck.webp",         names: ["Truck"] },

  { map: "Inferno",  image: "images/inferno/short.webp",          names: ["Short"] },
  { map: "Inferno",  image: "images/inferno/stairs.webp",         names: ["Stairs"] },
  { map: "Inferno",  image: "images/inferno/a_backsite.webp",     names: ["A Backsite"] },
  { map: "Inferno",  image: "images/inferno/a-default.webp",      names: ["A Default"] },
  { map: "Inferno",  image: "images/inferno/arch.webp",           names: ["Arch"] },
  { map: "Inferno",  image: "images/inferno/b-1.webp",            names: ["B 1"] },
  { map: "Inferno",  image: "images/inferno/b-2.webp",            names: ["B 2"] },
  { map: "Inferno",  image: "images/inferno/balcony.webp",        names: ["Balcony"] },
  { map: "Inferno",  image: "images/inferno/bedroom.webp",        names: ["Bedroom"] },
  { map: "Inferno",  image: "images/inferno/boiler.webp",         names: ["Boiler"] },
  { map: "Inferno",  image: "images/inferno/brackets.webp",       names: ["Brackets", "Top Mid"] },
  { map: "Inferno",  image: "images/inferno/bridge.webp",         names: ["Bridge"] },
  { map: "Inferno",  image: "images/inferno/car.webp",            names: ["Car", "Top Banana"] },
  { map: "Inferno",  image: "images/inferno/close_left.webp",     names: ["Close Left"] },
  { map: "Inferno",  image: "images/inferno/coffins.webp",        names: ["Coffins"] },
  { map: "Inferno",  image: "images/inferno/dark.webp",           names: ["Dark"] },
  { map: "Inferno",  image: "images/inferno/fountain.webp",       names: ["Fountain"] },
  { map: "Inferno",  image: "images/inferno/graveyard.webp",      names: ["Graveyard"] },
  { map: "Inferno",  image: "images/inferno/half_wall.webp",      names: ["Half Wall"] },
  { map: "Inferno",  image: "images/inferno/halls.webp",          names: ["Halls"] },
  { map: "Inferno",  image: "images/inferno/library.webp",        names: ["Library"] },
  { map: "Inferno",  image: "images/inferno/logs.webp",           names: ["Logs"] },
  { map: "Inferno",  image: "images/inferno/long_corner.webp",    names: ["Long Corner", "Cubby"] },
  { map: "Inferno",  image: "images/inferno/long.webp",           names: ["Long"] },
  { map: "Inferno",  image: "images/inferno/mini_pit.webp",       names: ["Mini Pit"] },
  { map: "Inferno",  image: "images/inferno/newbox.webp",         names: ["New Box", "B 3"] },
  { map: "Inferno",  image: "images/inferno/pit.webp",            names: ["Pit"] },
  { map: "Inferno",  image: "images/inferno/pool.webp",           names: ["Pool"] },
  { map: "Inferno",  image: "images/inferno/porch.webp",          names: ["Porch"] },
  { map: "Inferno",  image: "images/inferno/ramp.webp",           names: ["Ramp"] },
  { map: "Inferno",  image: "images/inferno/sandbags.webp",       names: ["Sandbags"] },
].freeze

LOH_NAMES = %w[лох пітух анскіл ретард сракабанька пітушара лошара дцп рак підар токсік]
LOH_GAMES = ['Якась діч', 'В якійсь хєрні', 'Дрочить', '🐁']

WIN_PHRASES = ['Вітаю шановні', 'Віннер віннер чікен діннер', 'Ізі гейм', 'Ізі брізі']
LOSE_PHRASES = ['Мінус єбала', 'Не витащили', 'Спробуйте ще', 'Спробуйте іншу гру']
