require 'minitest/autorun'
require 'minitest/pride'
require './lib/character'

class CharacterTest < MiniTest::Test

  def test_it_exists
    char = Character.new("a")

    assert_instance_of Character, char
  end

  def test_it_has_readable_attributes
    char1 = Character.new("a")
    char2 = Character.new(["0.", "..", ".."])

    assert_equal "a", char1.input
    assert_equal ["0.", "..", ".."], char2.input
  end

  def test_it_translates
    char1 = Character.new("a")
    char2 = Character.new(["0.", "..", ".."])

    assert_equal ["0.", "..", ".."], char1.translate
    assert_equal "a", char2.translate
  end
end
