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
    @ready_info[from['id']] = { time: time, info: from }
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
        res += "🔹 #{user_name(info)} - #{humanize_time(info[:time])}\n"
      end
      res
    end

  end

  def reply_markup
    {
      inline_keyboard: [
        [
          { text: '❌ Вє', callback_data: 'ready:ve' },
          { text: '🏳️‍🌈 Якщо я 5й', callback_data: 'ready:last' },
        ],
        [
          { text: '🏃 Йду', callback_data: 'ready:coming' },
          { text: '⏳ 10 хв', callback_data: 'ready:10_min' },
          { text: '⏳ 20 хв', callback_data: 'ready:20_min' },
        ],
        [
          { text: '🕗 Буду в 20', callback_data: 'ready:in_20' },
          { text: '🕘 Буду в 21', callback_data: 'ready:in_21' },
          { text: '🕙 Буду в 22', callback_data: 'ready:in_22' },
        ],
      ]
    }
  end

  def humanize_time(time)
    case time
    when 've'
      'Вє (лох)'
    when 'last'
      'Буде 5м'
    when 'coming'
      'Біжить'
    when '10_min'
      'Через 10 хв'
    when '20_min'
      'Через 20 хв'
    when 'in_20'
      'Буде в 20'
    when 'in_21'
      'Буде в 21'
    when 'in_22'
      'Буде в 22'
    else
      ''
    end
  end

  def user_name(info)
    info[:info]['first_name'] || info[:info]['username']
  end
end
