require './lib/dictionary'
require './lib/searchable'

class NightReader
  include Searchable

  attr_reader :input_file, :output_file, :dictionary

  def initialize(input_file, output_file)
    @input_file = input_file
    @output_file = output_file
    @dictionary = Dictionary.from_csv('./data/braille_dictionary.csv')
    #decode_from_braille
  end #initialize

  def input_file_path
    "./texts/#{@input_file}"
  end

  def output_file_path
    "./texts/#{@output_file}"
  end
end
