require './lib/dictionary'
require './lib/helpable'

class NightWriter
  include Helpable

  attr_reader :input_file, :output_file, :dictionary

  def initialize(input_file, output_file)
    @input_file = input_file
    @output_file = output_file
    @dictionary = Dictionary.from_csv('./data/braille_dictionary.csv')
    encode_to_braille if File.exist?(input_file_path)
  end

  def encode_to_braille
    r1 = create_row_1
    r2 = create_row_2
    r3 = create_row_3
    until r3 == ""
      write_to_file(r1[0..79], output_file_path, :append)
      r1.slice!(0..79)
      write_to_file(r2[0..79], output_file_path, :append)
      r2.slice!(0..79)
      write_to_file(r3[0..79], output_file_path, :append)
      r3.slice!(0..79)
    end
    puts create_message
  end

  def create_row_1
    string = ""
    array_of_words_in_chars.map do |array|
      string.concat array[0] + array[1]
    end
    string
  end

  def create_row_2
    string = ""
    array_of_words_in_chars.map do |array|
      string.concat array[2] + array[3]
    end
    string
  end

  def create_row_3
    string = ""
    array_of_words_in_chars.map do |array|
      string.concat array[4] + array[5]
    end
    string
  end

  def array_of_words_in_chars
    char_array_from_file.reduce([]) do |acc, character|
      acc << find_matching_letter_braille_pair(character).braille.chars
      acc
    end
  end

  def char_array_from_file
    read_file(input_file_path).chomp.split("")
  end

end #NightWriter
