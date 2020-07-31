require './lib/dictionary'
require './lib/searchable'

class NightReader
  include Searchable

  def initialize(input_file, output_file)
    @input_file = input_file
    @output_file = output_file
    @dictionary = Dictionary.from_csv('./data/braille_dictionary.csv')
    #decode_from_braille
  end #initialize
end
