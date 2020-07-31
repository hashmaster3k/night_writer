require './lib/night_writer'
require 'minitest/autorun'
require 'minitest/pride'
require 'mocha/minitest'

class SearchableTest < Minitest::Test

  def setup
    input_file  = 'messages.txt'
    output_file = 'braille.txt'

    @nightwriter = NightWriter.new(input_file, output_file)
  end

  def test_find_matching_letter
    assert_equal 'h', @nightwriter.find_matching_letter_braille_pair("h").letter
    assert_equal '0.\n00\n..', @nightwriter.find_matching_letter_braille_pair("h").braille
  end

end
