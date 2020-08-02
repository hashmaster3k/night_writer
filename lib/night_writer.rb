require './lib/dictionary'
require './lib/helpable'

class NightWriter
  include Helpable

  attr_reader :input_file, :output_file, :dictionary

  def initialize(input_file, output_file)
    @input_file = input_file
    @output_file = output_file
    @dictionary = Dictionary.from_csv('./data/braille_dictionary.csv')
    encode_to_braille
  end

  def encode_to_braille
    result = array_of_words_in_chars
    3.times do
      counter = 0
      iteration = ""
      result.each_with_index do |letter, i|
        iteration.concat(letter[0] + letter[1])
        result[i].slice!(0..1)
        write_to_file(iteration, output_file_path, :append) if counter == result.length - 1
        counter += 1
      end
    end
    puts create_message
  end

  def char_array_from_file
    read_file(input_file_path).chomp.split("")
  end

  def array_of_words_in_chars
    char_array_from_file.reduce([]) do |acc, character|
      acc << find_matching_letter_braille_pair(character).braille.chars
      acc
    end
  end

end #NightWriter

#NightWriter.new(ARGV[0], ARGV[1])
#ruby ./lib/night_writer.rb message.txt braille.txt
