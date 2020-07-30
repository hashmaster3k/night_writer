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

end
