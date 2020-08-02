require './lib/night_writer'
require 'minitest/autorun'
require 'minitest/pride'
require 'mocha/minitest'


class HelpableTest < Minitest::Test

  def setup
    input_file  = 'message.txt'
    output_file = 'braille.txt'

    @nightwriter = NightWriter.new(input_file, output_file)
  end

  def test_input_file_path
    assert_equal './texts/message.txt', @nightwriter.input_file_path
  end

  def test_output_file_path
    assert_equal './texts/braille.txt', @nightwriter.output_file_path
  end

  def test_find_matching_letter
    assert_equal 'h', @nightwriter.find_matching_letter_braille_pair('h').letter
    assert_equal '0.00..', @nightwriter.find_matching_letter_braille_pair('h').braille
  end

  def test_find_reverse_letter_braille_pair
    assert_equal 'h', @nightwriter.find_reverse_letter_braille_pair('0.00..').letter
  end

  def test_created_message
    @nightwriter.stubs(:output_file).returns('greeting.txt')
    @nightwriter.stubs(:read_file).returns('hello')

    expected = "Created greeting.txt containing 5 characters"

    assert_equal expected, @nightwriter.create_message
  end

end
