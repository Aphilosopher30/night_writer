require 'minitest/autorun'
require 'minitest/pride'
require './lib/alpha_text'

class AlphaTextTest < MiniTest::Test

  def test_it_exists
    text = AlphaText.new("abcd\nefg")

    assert_instance_of AlphaText, text
  end

  def test_it_has_readable_attributes
    text = AlphaText.new("a(bC)d\nefG")

    assert_equal ["a","b","c","d"," ","e","f","g"], text.character_list
  end

  def test_remove_unreadable
    doc = AlphaText.new("")

    assert_equal "abcd\nefg", doc.remove_unreadable("a(bC)d\nefG")
  end

  def test_replace_new_line
    doc = AlphaText.new("a(bC)d\nefG")

    assert_equal "a b c", doc.replace_new_line("a\nb\nc")
  end

  def test_tralslate_text
    doc = AlphaText.new("a")

    assert_equal [["0.","..",".."]], doc.translate_text(["a"])
  end

  def test_designate_line_brakes
    doc = AlphaText.new("")

    text = "aaaaa bbb ccc"

    assert_equal ["aaaaa bbb", "ccc"], doc.designate_line_brakes(text, 10)
  end

  def test_printable_translation
    doc = AlphaText.new("abcd")
    doc.printable_translation

    test = "0.0.0000\n..0....0\n........\n"

    assert_equal test, doc.printable_translation

  end

end
