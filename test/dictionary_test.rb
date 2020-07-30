require './lib/dictionary'
require 'minitest/autorun'
require 'minitest/pride'

class DictionaryTest < Minitest::Test

  def test_it_exists
    test = Dictionary.new(letter: "a",
                          braille: "0.\n..\n..")

    assert_instance_of Dictionary, test
  end

end
