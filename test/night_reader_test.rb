require './test/test_helper'
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
    assert_equal 32, @nightreader.dictionary.length
  end

  def test_decode_message
    input_file  = 'nil_1.txt'
    output_file = 'nil_2.txt'

    nightreader = NightReader.new(input_file, output_file)

    hi = "0..0\n000.\n...."

    nightreader.stubs(:read_file).returns(hi)

    assert_equal "hi", nightreader.decode_message
  end

  def test_num_of_loops
    hi = "0..0\n000.\n...."

    @nightreader.stubs(:read_file).returns(hi)

    assert_equal 2, @nightreader.num_of_loops
  end

  def test_split_file_content
    @nightreader.stubs(:read_file).returns("hi\nthere")
    expected = ['hi', 'there']

    assert_equal expected, @nightreader.split_file_content
  end

  def test_indices_per_row
    @nightreader.stubs(:indices_list).returns([0,1,2,3,4,5,6,7,8])

    assert_equal [0,3,6], @nightreader.indices_per_row[0]
    assert_equal [1,4,7], @nightreader.indices_per_row[1]
    assert_equal [2,5,8], @nightreader.indices_per_row[2]
  end

  def test_create_rows
    this = [[0], [1], [2]]
    @nightreader.stubs(:get_indices).returns(this)

    hi = "0..0\n000.\n...."
    @nightreader.stubs(:read_file).returns(hi)
    assert_equal "0..0", @nightreader.create_rows[0]
    assert_equal "000.", @nightreader.create_rows[1]
    assert_equal "....", @nightreader.create_rows[2]
  end

end
