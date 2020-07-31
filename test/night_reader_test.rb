require './lib/night_reader'
require 'minitest/autorun'
require 'minitest/pride'
require 'mocha/minitest'

class NightReaderTest < Minitest::Test

  def setup
    input_file  = 'message.txt'
    output_file = 'braille.txt'

    @nightreader = NightReader.new(input_file, output_file)
  end

  def test_it_exists
    assert_instance_of NightReader, @nightreader
  end

  def test_has_readable_attributes
    assert_equal 'message.txt', @nightreader.input_file
    assert_equal 'braille.txt', @nightreader.output_file
    assert_equal './texts/message.txt', @nightreader.input_file_path
    assert_equal './texts/braille.txt',  @nightreader.output_file_path
    assert_equal 27, @nightreader.dictionary.length
  end

end
