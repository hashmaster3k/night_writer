require './lib/dictionary'
require './lib/helpable'

class NightReader
  include Helpable

  attr_reader :input_file, :output_file, :dictionary

  def initialize(input_file, output_file)
    @input_file = input_file
    @output_file = output_file
    @dictionary = Dictionary.from_csv('./data/braille_dictionary.csv')
    decode_from_braille if File.exist?(input_file_path)
  end

  def decode_from_braille
    write_to_file(decode_message, output_file_path)
    puts create_message
  end

  def decode_message
    decoded_message = ""
    row_1 = create_rows[0]
    row_2 = create_rows[1]
    row_3 = create_rows[2]
    num_of_loops.times do
      message = ""
      message.concat row_1[0] + row_1[1]
      row_1.slice!(0..1)
      message.concat row_2[0] + row_2[1]
      row_2.slice!(0..1)
      message.concat row_3[0] + row_3[1]
      row_3.slice!(0..1)
      decoded_message.concat(find_reverse_letter_braille_pair(message).letter)
    end
    decoded_message
  end

  def num_of_loops
    create_rows[0].length / 2
  end

  def split_file_content
    read_file(input_file_path).split("\n")
  end

  def indices_list
    (0..split_file_content.length - 1).to_a
  end

  def indices_per_row
    row1 = indices_list.find_all {|num| num if num == 0 || num == 3 || num == 6 || num == 9 || num == 12}
    row2 = indices_list.find_all {|num| num if num == 1 || num == 4 || num == 7 || num == 10 || num == 13}
    row3 = indices_list.find_all {|num| num if num == 2 || num == 5 || num == 8 || num == 11 || num == 14}
    return row1, row2, row3
  end

  def create_rows
    row1 = indices_per_row[0].map {|num| split_file_content[num]}.join
    row2 = indices_per_row[1].map {|num| split_file_content[num]}.join
    row3 = indices_per_row[2].map {|num| split_file_content[num]}.join
    return row1, row2, row3
  end

end #NightReader
