require './lib/dictionary'
require './lib/helpable'

class NightReader
  include Helpable

  attr_reader :input_file, :output_file, :dictionary, :decoded_message

  def initialize(input_file, output_file)
    @input_file = input_file
    @output_file = output_file
    @decoded_message = ""
    @dictionary = Dictionary.from_csv('./data/braille_dictionary.csv')
    decode_from_braille if File.exist?(input_file_path)
  end #initialize

  def decode_from_braille
    decode
    write_to_file(decoded_message, output_file_path)
    puts create_message
  end

  def decode
    row_1 = create_row_1
    row_2 = create_row_2
    row_3 = create_row_3
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
    create_row_1.length / 2
  end

  def split_file_content
    read_file(input_file_path).split("\n")
  end

  def get_indices
    num_list = (0..split_file_content.length - 1).to_a

    r1 = []
    num_list.each do |num|
      r1 << num if num == 0 || num == 3 || num == 6 || num == 9 || num == 12
    end

    r2 = []
    num_list.each do |num|
      r2 << num if num == 1 || num == 4 || num == 7 || num == 10 || num == 13
    end

    r3 = []
    num_list.each do |num|
      r3 << num if num == 2 || num == 5 || num == 8 || num == 11 || num == 14
    end

    return r1, r2, r3
  end

  def create_row_1
    row = get_indices[0]
    string = ""
    row.each do |num|
      string.concat split_file_content[num]
    end
    string
  end

  def create_row_2
    row = get_indices[1]
    string = ""
    row.each do |num|
      string.concat split_file_content[num]
    end
    string
  end

  def create_row_3
    row = get_indices[2]
    string = ""
    row.each do |num|
      string.concat split_file_content[num]
    end
    string
  end

end #NightReader
