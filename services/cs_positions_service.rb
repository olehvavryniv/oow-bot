class CsPositionsService
  def generate_random_position_key
    CS_POSITIONS.to_a.sample.first
  end

  def generate_answers_for_given_position(position_key)
    correct_names = get_names_from_position_key(position_key)
    map = get_map_from_position_key(position_key)
    given_map_positions = get_all_positions_for_given_map(map)
    #remove correct name from the list
    given_map_positions.delete(position_key)
    wrong_names = []
    given_map_positions.values.each do |i|
      wrong_names << i[map].flatten
    end
    correct_answer = correct_names.sample
    formatted_array =  (wrong_names.flatten.first(2) << correct_answer).shuffle
    {
      inline_keyboard: [
        [
          { text: "#{formatted_array[0]}", callback_data: "random_position:#{formatted_array[0]}/#{correct_answer}" },
        ],
        [
          { text: "#{formatted_array[1]}", callback_data: "random_position:#{formatted_array[1]}/#{correct_answer}" },
        ],
        [
          { text: "#{formatted_array[2]}", callback_data: "random_position:#{formatted_array[2]}/#{correct_answer}" },
        ],
      ]
    }
  end

  private

  def get_names_from_position_key(position_key)
    CS_POSITIONS[position_key].values.first
  end
  def get_map_from_position_key(position_key)
    CS_POSITIONS[position_key].keys[0]
  end
  def get_all_positions_for_given_map(map)
    CS_POSITIONS.select {|k, v| v.keys.first == map }
  end
end
