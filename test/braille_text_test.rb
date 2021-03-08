require 'minitest/autorun'
require 'minitest/pride'
require './lib/braille_text'
require './lib/read_write'

class BrailleTextTest < MiniTest::Test

  def test_it_exists
    doc = ReadWrite.new("test_brail.txt")
    text = BrailleText.new(doc.file)

    assert_instance_of BrailleText, text
  end

  def test_it_has_readable_attributes
    doc = ReadWrite.new("test_brail.txt")
    text = BrailleText.new(doc.file)

    test = [["..", "00", ".0"],
            ["0.", "..", ".0"],
            [".0", "0.", ".."],
            ["..", "00", ".."],
            ["..", "..", ".."],
            ["00", "0.", ".."],
            ["00", "00", ".."],
            ["00", ".0", ".."]
          ]

    assert_equal test, text.character_list
  end

  def test_tralslate_text
    doc = BrailleText.new("a")

    assert_equal ["a"], doc.translate_text([["0.","..",".."]])
  end

  def test_designate_line_brakes
    doc = BrailleText.new("")

    text = "aaaaa bbb ccc"

    assert_equal ["aaaaa bbb", "ccc"], doc.designate_line_brakes(text, 10)
  end

  def test_printable_translation
    doc = BrailleText.new("0.0.0000\n..0....0\n........\n")
    doc.printable_translation

    test = "abcd\n"

    assert_equal test, doc.printable_translation
  end


end
