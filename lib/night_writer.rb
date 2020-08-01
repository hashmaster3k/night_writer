require './lib/dictionary'
require './lib/searchable'

class NightWriter
  include Searchable

  attr_reader :input_file, :output_file, :dictionary

  def initialize(input_file, output_file)
    @input_file = input_file
    @output_file = output_file
    @dictionary = Dictionary.from_csv('./data/braille_dictionary.csv')
    encode_to_braille
  end #initialize

  def input_file_path
    "./texts/#{@input_file}"
  end

  def output_file_path
    "./texts/#{@output_file}"
  end

  def encode_to_braille
    result = array_of_words_in_chars
    3.times do
      counter = 0
      iteration = ""
      result.each_with_index do |letter, i|
        iteration.concat(letter[0] + letter[1])
        result[i].slice!(0..1)
        write_to_file(iteration) if counter == result.length - 1
        counter += 1
      end
    end
    puts created_message
  end

  def created_message
    content = File.read(output_file_path)
    "Created #{output_file} containing #{content.length} characters"
  end #created_message

  def write_to_file(text)
    File.open(output_file_path, 'a') {|file| file.puts text}
  end #write_to_file

  def char_array_from_file
    File.read(input_file_path).chomp.split("")
  end #char_array_from_file

  def array_of_words_in_chars
    char_array_from_file.reduce([]) do |acc, character|
      acc << find_matching_letter_braille_pair(character).braille.chars
      acc
    end
  end #array_of_words_in_chars

end #NightWriter

NightWriter.new(ARGV[0], ARGV[1])
#ruby ./lib/night_writer.rb message.txt braille.txt
