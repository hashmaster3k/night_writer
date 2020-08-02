require './lib/night_writer'
require 'minitest/autorun'
require 'minitest/pride'


class SearchableTest < Minitest::Test

  def setup
    input_file  = 'message.txt'
    output_file = 'braille.txt'

    @nightwriter = NightWriter.new(input_file, output_file)
  end

  def test_find_matching_letter
    assert_equal 'h', @nightwriter.find_matching_letter_braille_pair('h').letter
    assert_equal '0.00..', @nightwriter.find_matching_letter_braille_pair('h').braille
  end

  def test_find_reverse_letter_braille_pair
    assert_equal 'h', @nightwriter.find_reverse_letter_braille_pair('0.00..').letter
  end

end
