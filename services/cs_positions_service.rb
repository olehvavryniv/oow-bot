require 'singleton'

class CsPositionsService
  include ::Singleton

  OPTIONS_COUNT = 3

  def random_position
    CS_POSITIONS.sample
  end

  # Returns the image to show and the keyboard of answers to pick from.
  # The callback data carries the position's index, not the answer itself,
  # so the reveal can list every callout the position is known by.
  def new_question
    index = rand(CS_POSITIONS.size)
    position = CS_POSITIONS[index]
    options = (decoys_for(position) << position[:names].sample).shuffle

    {
      image: position[:image],
      keyboard: {
        inline_keyboard: options.map do |name|
          [{ text: name, callback_data: "random_position:#{index}:#{name}" }]
        end
      }
    }
  end

  def check(index, chosen)
    position = CS_POSITIONS[index.to_i]
    {
      correct: position[:names].include?(chosen),
      names: position[:names].join(' / ')
    }
  end

  private

  def decoys_for(position)
    CS_POSITIONS
      .select { |p| p[:map] == position[:map] && p[:image] != position[:image] }
      .sample(OPTIONS_COUNT - 1)
      .map { |p| p[:names].sample }
  end
end
