require 'minitest/autorun'
require 'minitest/pride'
require './lib/read_write'

class ReadWriteTest < MiniTest::Test

  def test_it_exists
    doc = ReadWrite.new("test")

    assert_instance_of ReadWrite, doc
  end

  def test_it_has_readable_attributes
    doc = ReadWrite.new("test.txt")

    assert_equal "Andrews test doc;\n(Used for testing)\n", doc.file
  end

  def test_is_brail?
    doc = ReadWrite.new("test.txt")
    doc2 = ReadWrite.new("test_brail.txt")

    assert_equal false, doc.is_brail?
    assert_equal true, doc2.is_brail?
  end
end
