class ShotamService
  include ::Singleton

  attr_accessor :last_messages
  attr_accessor :ready_info

  def initialize
    @last_messages = {}
    @ready_info = {}
  end

  def generate_message
    [
      message_body,
      reply_markup
    ]
  end

  def set_ready_info(from, time)
    @ready_info[from['id']] = { time: time, info: from, sent_at: Time.now }
    @last_messages.each do |chat_id, message_id|
      OowBot.instance.bot.edit_message_text(chat_id: chat_id, message_id: message_id, text: message_body, reply_markup: reply_markup)
    end
  end

  def sanitize_info
    now = Time.now
    if now.hour == 0 && now.min == 0
      @ready_info = {}
    end
  end

  private

  def message_body
    if @ready_info.length == 0
      "❌ Поки ніхто не буде\n" +
        "А ти?"
    else
      res = ""
      @ready_info.each do |_id, info|
        time, estimate = time_choice_to_estimate(info)
        time_info = estimate ? estimate : time.strftime('%H:%M')
        res += "🔹 #{user_name(info)} - #{time_info}\n"
      end
      res
    end

  end

  def reply_markup
    {
      inline_keyboard: [
        [
          { text: '❌ Вє', callback_data: 'ready:ve' },
          { text: '👠 Хз', callback_data: 'ready:hz' },
          { text: '🏳️‍🌈 Буду 5м', callback_data: 'ready:last' },
        ],
        [
          { text: '🏃 Йду', callback_data: 'ready:coming' },
          { text: '⏳ 10 хв', callback_data: 'ready:10_min' },
          { text: '⏳ 20 хв', callback_data: 'ready:20_min' },
          { text: '⏳ 30 хв', callback_data: 'ready:30_min' },
        ],
        [
          { text: '🕗 20:00', callback_data: 'ready:in_20' },
          { text: '🕘 21:00', callback_data: 'ready:in_21' },
          { text: '🕘 21:30', callback_data: 'ready:in_2130' },
        ],
        [
          { text: '🕙 22:00', callback_data: 'ready:in_22' },
          { text: '🕙 22:30', callback_data: 'ready:in_2230' },
          { text: '🕙 23:00', callback_data: 'ready:in_23' },
        ]
      ]
    }
  end

  def time_choice_to_estimate(info)
    now = Time.now
    case info[:time]
    when 've'
      [nil, "Вє (#{LOH_NAMES.sample})"]
    when 'hz'
      [nil, "Каблук думає"]
    when 'last'
      [nil, 'Буде 5м']
    when 'coming'
      [info[:sent_at] + (5 * 60), nil]
    when '10_min'
      [info[:sent_at] + (10 * 60), nil]
    when '20_min'
      [info[:sent_at] + (20 * 60), nil]
    when '30_min'
      [info[:sent_at] + (30 * 60), nil]
    when 'in_20'
      [Time.local(now.year, now.month, now.day, 20, 0), nil]
    when 'in_21'
      [Time.local(now.year, now.month, now.day, 21, 0), nil]
    when 'in_2130'
      [Time.local(now.year, now.month, now.day, 21, 30), nil]
    when 'in_22'
      [Time.local(now.year, now.month, now.day, 22, 0), nil]
    when 'in_2230'
      [Time.local(now.year, now.month, now.day, 22, 30), nil]
    when 'in_23'
      [Time.local(now.year, now.month, now.day, 23, 0), nil]
    else
      [nil, nil]
    end
  end

  def user_name(info)
    info[:info]['first_name'] || info[:info]['username']
  end
end
