require './test/test_helper'
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

  def test_read_file
    File.delete('./texts/message.txt')
    File.open('./texts/message.txt', 'w') {|f| f.write "hello world"}

    assert_equal "hello world", @nightwriter.read_file("./texts/message.txt")
  end

  def test_write_to_file
    File.delete('./texts/message.txt')
    File.new('./texts/message.txt', 'w')

    @nightwriter.write_to_file('hello world', './texts/message.txt')

    assert_equal "hello world\n", @nightwriter.read_file("./texts/message.txt")
  end

  def test_find_matching_letter
    assert_equal 'h', @nightwriter.find_matching_letter_braille_pair('h').letter
    assert_equal '0.00..', @nightwriter.find_matching_letter_braille_pair('h').braille
  end

  def test_find_reverse_letter_braille_pair
    assert_equal 'h', @nightwriter.find_reverse_letter_braille_pair('0.00..').letter
  end

end
