require './lib/night_writer'
require 'minitest/autorun'
require 'minitest/pride'

class NightWriterTest < Minitest::Test

  def test_it_exists
    input_file  = './messages.txt'
    output_file = './braille.txt'

    nightwriter = NightWriter.new(input_file, output_file)

    assert_instance_of NightWriter, nightwriter
  end

end
