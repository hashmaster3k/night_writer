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
    row_1 = split_file_content[0]
    row_2 = split_file_content[1]
    row_3 = split_file_content[2]

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
    split_file_content[0].length / 2
  end

  def split_file_content
    read_file(input_file_path).split("\n")
  end

end #NightReader

#NightReader.new(ARGV[0], ARGV[1])
#ruby ./lib/night_reader.rb braille.txt original_message.txt
