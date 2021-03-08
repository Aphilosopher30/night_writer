require 'minitest/autorun'
require 'minitest/pride'
require './lib/read_write'

class ReadWriteTest < MiniTest::Test

  def test_it_exists
    doc = ReadWrite.new("john.txt")

    assert_instance_of ReadWrite, doc
  end

  def test_it_has_readable_attributes
    doc = ReadWrite.new("test.txt")

    assert_equal "Andrews test doc;\n(Used for testing)\n", doc.file
  end

  def test_remove_unreadable
    doc = ReadWrite.new("test.txt")

    assert_equal "andrews test doc\nused for testing\n", doc.remove_unreadable
  end

  def test_replace_new_line
    doc = ReadWrite.new("test.txt")

    assert_equal "a b c", doc.replace_new_line("a\nb\nc")
  end

  def test_is_brail?
    doc = ReadWrite.new("test.txt")
    doc2 = ReadWrite.new("test_brail.txt")

    assert_equal false, doc.is_brail?
    assert_equal true, doc2.is_brail?
  end

  def test_process_text_brail
    doc = ReadWrite.new("test_brail.txt")

    test = [["..", "00", ".0"],
            ["0.", "..", ".0"],
            [".0", "0.", ".."],
            ["..", "00", ".."],
            ["00", "0.", ".."],
            ["00", "00", ".."],
            ["00", ".0", ".."]
          ]

    assert_equal test, doc.process_text_brail
  end

  def test_process_text_alpha
    doc = ReadWrite.new("test.txt")

    assert_equal ["a","n","d","r","e","w","s"," ","t","e","s","t"," ","d", "o","c"," ","u","s","e","d"," ","f","o","r"," ","t","e","s","t","i","n","g", " "] , doc.process_text_alpha
  end

  def test_translate_line
    doc = ReadWrite.new("test.txt")

    translate1 = ["a","b","c","d","e"]
    translate2 =[["0.", "..", ".."],["0.", "0.", ".."], ["00", "..", ".."], ["00", ".0", ".."], ["0.", ".0", ".."]]

    assert_equal translate1, doc.translate_line(translate2)
    assert_equal translate2, doc.translate_line(translate1)
  end

  def test_designate_line_brakes
    doc = ReadWrite.new("john.txt")

    text = doc.process_text_alpha
    text2= "asdf asdf hgv mjuhgv mjhgv mhgv nhgvc dftyhjn knk as gjdhg kjdsh gkjda hfglk ag hkafjgh kjadhfgku hs.d,ghjk,fxckj gdflg dafsdj kfahgfh asasdfasdfasdfasf"

    assert_equal "", doc.designate_line_brakes(text)
  end



end
