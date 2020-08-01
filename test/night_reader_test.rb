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
    File.open('./texts/braille.txt', 'w') {|f| f.write "testing\n123"}
    assert_equal ['testing','123'], @nightreader.read_file
  end

  def test_write_to_file
    File.delete('./texts/original_message.txt')
    File.new('./texts/original_message.txt', 'w')

    before = File.read('./texts/original_message.txt')
    
    assert_equal 0, before.length

    @nightreader.write_to_file('test')

    after = File.read('./texts/original_message.txt')

    assert_equal 5, after.length
  end

  def test_decode_from_braille
    File.delete('./texts/original_message.txt')
    File.new('./texts/original_message.txt', 'w')

    hello_world = "0.0.0.0.0....00.0.0.00\n00.00.0..0..00.0000..0\n....0.0.0....00.0.0..."

    File.open('./texts/braille.txt', 'w') {|f| f.write hello_world}
    @nightreader.decode_from_braille
    actual = File.read('./texts/original_message.txt').chomp
    assert_equal "hello world", actual
  end

end
