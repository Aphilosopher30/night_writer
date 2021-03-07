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

    assert_equal "andrews test doc used for testing ", doc.process_text_alpha
  end

end
