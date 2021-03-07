require 'minitest/autorun'
require 'minitest/pride'
require './lib/line_brail'

class LineBrailTest < MiniTest::Test

  def test_it_exists
    abc = [["0.", "..", ".."], ["0.", "0.", ".."], ["00", "..", ".."]]
    line = LineBrail.new(abc)

    assert_instance_of LineBrail, line
  end

  def test_attributes
    abc = [["0.", "..", ".."], ["0.", "0.", ".."], ["00", "..", ".."]]
    line = LineBrail.new(abc)

    assert_equal abc, line.line_array
  end

  def test_generate_printable_line
    abc = [["0.", "..", ".."], ["0.", "0.", ".."], ["00", "..", ".."]]
    line = LineBrail.new(abc)

    stuff = "0.0.00\n..0...\n......\n"

    assert_equal stuff, line.generate_printable_line
  end

end
