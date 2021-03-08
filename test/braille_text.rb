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
            ["00", "0.", ".."],
            ["00", "00", ".."],
            ["00", ".0", ".."]
          ]

    assert_equal test, text.character_list
  end

end
