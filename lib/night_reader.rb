require './lib/dictionary'
require './lib/searchable'

class NightReader
  include Searchable

  attr_reader :input_file, :output_file, :dictionary

  def initialize(input_file, output_file)
    @input_file = input_file
    @output_file = output_file
    @dictionary = Dictionary.from_csv('./data/braille_dictionary.csv')
    decode_from_braille
  end #initialize

  def input_file_path
    "./texts/#{@input_file}"
  end

  def output_file_path
    "./texts/#{@output_file}"
  end

  def read_file
    File.read(input_file_path).split("\n")
  end

  def write_to_file(text)
    File.open(output_file_path, 'a') {|file| file.puts text}
  end

  def decode_from_braille
    row_1 = read_file[0]
    row_2 = read_file[1]
    row_3 = read_file[2]

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
    write_to_file(final)
    puts created_message
  end

  def created_message
    content = File.read(output_file_path)
    "Created #{output_file} containing #{content.length} characters"
  end #created_message

end

NightReader.new(ARGV[0], ARGV[1])
#ruby ./lib/night_reader.rb braille.txt original_message.txt
