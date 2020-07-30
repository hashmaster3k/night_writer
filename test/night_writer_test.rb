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

  def test_has_readable_attributes
    input_file  = './messages.txt'
    output_file = './braille.txt'

    nightwriter = NightWriter.new(input_file, output_file)

    assert_equal input_file, nightwriter.input_file
    assert_equal output_file, nightwriter.output_file
  end
end
