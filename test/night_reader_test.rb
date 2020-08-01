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
    assert_equal './texts/braille.txt', @nightreader.input_file_path
    assert_equal './texts/original_message.txt',  @nightreader.output_file_path
    assert_equal 27, @nightreader.dictionary.length
  end

  def test_read_file
    expected = File.read('./texts/braille.txt').chomp.length

    assert_equal expected, @nightreader.read_file.length
  end

end
