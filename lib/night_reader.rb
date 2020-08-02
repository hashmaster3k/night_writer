require './lib/dictionary'
require './lib/helpable'

class NightReader
  include Helpable

  attr_reader :input_file, :output_file, :dictionary

  def initialize(input_file, output_file)
    @input_file = input_file
    @output_file = output_file
    @dictionary = Dictionary.from_csv('./data/braille_dictionary.csv')
    decode_from_braille
  end #initialize

  def decode_from_braille
    row_1 = split_file_content[0]
    row_2 = split_file_content[1]
    row_3 = split_file_content[2]

    num = row_1.length / 2
    final = ""
    num.times do
      message = ""
      message.concat row_1[0] + row_1[1]
      row_1.slice!(0..1)
      message.concat row_2[0] + row_2[1]
      row_2.slice!(0..1)
      message.concat row_3[0] + row_3[1]
      row_3.slice!(0..1)
      letter = find_reverse_letter_braille_pair(message).letter
      final.concat(letter)
    end
    write_to_file(final, output_file_path)
    puts create_message
  end

  def split_file_content
    read_file(input_file_path).split("\n")
  end

end #NightReader

#NightReader.new(ARGV[0], ARGV[1])
#ruby ./lib/night_reader.rb braille.txt original_message.txt
