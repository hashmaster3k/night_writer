require './lib/night_writer'
require 'minitest/autorun'
require 'minitest/pride'
require 'mocha/minitest'

class NightWriterTest < Minitest::Test

  def setup
    input_file  = 'messages.txt'
    output_file = 'braille.txt'

    @nightwriter = NightWriter.new(input_file, output_file)
  end

  def test_it_exists
    assert_instance_of NightWriter, @nightwriter
  end

  def test_has_readable_attributes
    assert_equal './messages.txt', @nightwriter.input_file_path
    assert_equal './braille.txt',  @nightwriter.output_file_path
    assert_equal 27, @nightwriter.dictionary.length
  end

  def test_encodes_to_braille
    File.delete('./braille.txt')
    File.new('braille.txt', 'w')

    before = File.read('./braille.txt')

    assert_equal 0, before.length

    @nightwriter.encode_to_braille

    after = File.read('./braille.txt')

    assert_equal 69, after.length
  end

  def test_write_to_file
    File.delete('./braille.txt')
    File.new('braille.txt', 'w')

    before = File.read('./braille.txt')

    assert_equal 0, before.length

    @nightwriter.write_to_file('test')

    after = File.read('./braille.txt')

    assert_equal 5, after.length
  end

  def test_char_array_from_file
    number = File.read('./messages.txt').chomp.length
    assert_equal number, @nightwriter.char_array_from_file.length
  end

  def test_array_of_words_in_chars
    @nightwriter.stubs(:char_array_from_file).returns(["y","o","y","o"])

    expected = ["y","o","y","o"].length

    assert_equal expected, @nightwriter.array_of_words_in_chars.length
  end

end
