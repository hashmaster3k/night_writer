require './test/test_helper'
require './lib/night_writer'
require 'minitest/autorun'
require 'minitest/pride'
require 'mocha/minitest'

class NightWriterTest < Minitest::Test

  def setup
    input_file  = 'message.txt'
    output_file = 'braille.txt'

    @nightwriter = NightWriter.new(input_file, output_file)
  end

  def test_it_exists
    assert_instance_of NightWriter, @nightwriter
  end

  def test_has_readable_attributes
    assert_equal 'message.txt', @nightwriter.input_file
    assert_equal 'braille.txt', @nightwriter.output_file
    assert_equal 27, @nightwriter.dictionary.length
  end

  def test_encodes_to_braille
    File.delete('./texts/braille.txt')
    File.new('./texts/braille.txt', 'w')
    @nightwriter.stubs(:char_array_from_file).returns(['h','i'])
    @nightwriter.encode_to_braille
    expected = "0..0\n000.\n....\n"
    assert_equal expected, @nightwriter.read_file('./texts/braille.txt')
  end

  def test_char_array_from_file
    @nightwriter.stubs(:read_file).returns('hi')
    assert_equal ['h', 'i'], @nightwriter.char_array_from_file
  end

  def test_array_of_words_in_chars
    @nightwriter.stubs(:char_array_from_file).returns(["y","o","y","o"])

    expected = ["y","o","y","o"].length

    assert_equal expected, @nightwriter.array_of_words_in_chars.length
  end

end
