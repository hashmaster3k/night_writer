require './test/test_helper'
require './lib/dictionary'
require 'minitest/autorun'
require 'minitest/pride'

class DictionaryTest < Minitest::Test

  def test_it_exists
    test = Dictionary.new(letter: "a",
                          braille: "0.\n..\n..")

    assert_instance_of Dictionary, test
  end

  def test_has_readable_attributes
    test = Dictionary.new(letter: "a",
                          braille: "0.\n..\n..")

    assert_equal "a", test.letter
    assert_equal "0.\n..\n..", test.braille
  end

  def test_can_read_from_CSV
    dictionary = Dictionary.from_csv('./data/braille_dictionary.csv')

    assert_equal 33, dictionary.length
  end

end
