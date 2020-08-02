require './lib/night_reader'
require 'minitest/autorun'
require 'minitest/pride'
require 'mocha/minitest'

class NightReaderTest < Minitest::Test

  def setup
    input_file  = 'braille.txt'
    output_file = 'original_message.txt'

    @nightreader = NightReader.new(input_file, output_file)
  end

  def test_it_exists
    assert_instance_of NightReader, @nightreader
  end

  def test_has_readable_attributes
    assert_equal 'braille.txt', @nightreader.input_file
    assert_equal 'original_message.txt', @nightreader.output_file
    assert_equal 27, @nightreader.dictionary.length
  end

  def test_decode_from_braille
    File.delete('./texts/original_message.txt')
    File.new('./texts/original_message.txt', 'w')

    hello_world = "0.0.0.0.0....00.0.0.00\n00.00.0..0..00.0000..0\n....0.0.0....00.0.0..."
    @nightreader.stubs(:read_file).returns(hello_world)

    @nightreader.decode_from_braille
    actual = File.read('./texts/original_message.txt').chomp
    assert_equal "hello world", actual
  end

  def test_split_file_content
    @nightreader.stubs(:read_file).returns("hi\nthere")
    expected = ['hi', 'there']

    assert_equal expected, @nightreader.split_file_content
  end

end
