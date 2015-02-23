require 'minitest/autorun'
require 'minitest/pride'

# Write a method which accepts an array and returns a hash.  Each item in the
# array will be a string, and the returned hash should have last names as keys
# and first names as values.

def names(arr)
  return Hash.new if arr.nil? || arr.empty?
  # arr.map {|str| [str.split[-1], str.split[0]]}.to_h
  arr.reduce(Hash.new) { |h, s| h[s.split[-1]] = s.split[0] }
end


class ArrayAndHashPuzzle < MiniTest::Test

  def test_one_name
    expected = {"Washington" => "George"}
    assert_equal expected, names(["George Washington"])
  end

  def test_complex_name
    expected = {"Adams" => "John"}
    assert_equal expected, names(["John Quincy Adams"])
  end

  def test_two_names
    expected = {"Washington" => "George", "Adams" => "John"}
    assert_equal expected, names(["George Washington", "John Quincy Adams"])
  end

  def test_no_names
    assert_equal Hash.new, names(Array.new)
  end

  def test_no_array
    assert_equal Hash.new, names(nil)
  end

  def test_last_names_overwrite
    expected = {"Washington" => "George", "Roosevelt" => "Franklin"}
    assert_equal expected, names(["George Washington", "Theodore Roosevelt", "Franklin Roosevelt"])
  end
end
