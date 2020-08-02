require './test/test_helper'
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

  def test_decode
    input_file  = 'nil_1.txt'
    output_file = 'nil_2.txt'

    nightreader = NightReader.new(input_file, output_file)

    hi = "0..0\n000.\n...."

    nightreader.stubs(:read_file).returns(hi)
    nightreader.decode

    assert_equal "hi", nightreader.decoded_message
  end

  def test_num_of_loops
    hi = "0..0\n000.\n...."

    @nightreader.stubs(:read_file).returns(hi)

    assert_equal 2, @nightreader.num_of_loops
  end

  def test_split_file_content
    @nightreader.stubs(:read_file).returns("hi\nthere")
    expected = ['hi', 'there']

    assert_equal expected, @nightreader.split_file_content
  end

end
