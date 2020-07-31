require './lib/night_writer'
require 'minitest/autorun'
require 'minitest/pride'

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
    assert_equal "./messages.txt", @nightwriter.input_file_path
    assert_equal "./braille.txt",  @nightwriter.output_file_path
  end

  def test_copy_text_and_write
    expected = File.read("./messages.txt")
    @nightwriter.copy_text_and_write

    assert_equal expected, File.read("./braille.txt")
  end

end
