require 'minitest/autorun'
require 'minitest/pride'
require './lib/line_alpha'

class LineAlphaTest < MiniTest::Test

  def test_it_exists
    line = LineAlpha.new(["a","b","c"])

    assert_instance_of LineAlpha, line
  end

  def test_attributes
    line = LineAlpha.new(["a","b","c"])

    assert_equal ["a","b","c"], line.line_array
  end

  def test_generate_printable_line
    line = LineAlpha.new(["a","b","c"])

    assert_equal "abc\n", line.generate_printable_line
  end
end
