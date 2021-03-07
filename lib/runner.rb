
dictionary = {" " => ["..", "..", ".."],
              "a" => ["0.", "..", ".."],
              "b" => ["0.", "0.", ".."],
              "c" => ["00", "..", ".."],
              "d" => ["00", ".0", ".."],
              "e" => ["0.", ".0", ".."],
              "f" => ["00", "0.", ".."],
              "g" => ["00", "00", ".."],
              "h" => ["0.", "00", ".."],
              "i" => [".0", "0.", ".."],
              "j" => [".0", "00", ".."],
              "k" => ["0.", "..", "0."],
              "l" => ["0.", "0.", "0."],
              "m" => ["00", "..", "0."],
              "n" => ["00", ".0", "0."],
              "o" => ["00", ".0", "0."],
              "p" => ["0.", ".0", "0."],
              "q" => ["00", "00", "0."],
              "r" => ["0.", "00", "0."],
              "s" => [".0", "0.", "0."],
              "t" => [".0", "00", "0."],
              "u" => ["0.", "..", "00"],
              "v" => ["0.", "0.", "00"],
              "w" => [".0", "00", ".0"],
              "x" => ["00", "..", "00"],
              "y" => ["00", ".0", "00"],
              "z" => ["0.", ".0", "00"],
              "." => ["..", "00", ".0"],
              "," => ["..", "0.", ".."],
              "\n" => ["..", "..", ".."]
              }












    def sepperate_into_lines(super_string, max_length = 20)
      array_of_words = super_string.split
      line_array = []
      substring = ""
      array_of_words.each do |next_word|
        if substring.length + next_word.length >= max_length
          line_array << substring
          substring = ""
        else
          substring += next_word
          substring += " "
        end
      end
      line_array
    end





array_of_characters = [["a"],["b"],["c"],["d"]]







skipable = ";(){}[!@#$%^&*]"

read_file = "file1.txt"
text = File.open("./texts/alpha/#{read_file}", "r")
words = text.read.downcase.delete(skipable)

new_words = ""
words.each_char do |char|
  if char == "\n"
    char = " "
  end
  new_words += char
end

words = new_words

word_lines = sepperate_into_lines(words)
puts word_lines

word_lines.each
  array = words.split("").map! do |char|
    dictionary[char]
  end

translated_words = ""
3.times do |index|
  array.each do |part|
    pair = part[index]
    translated_words += pair
  end
  translated_words += "\n"
end





file_name = "braile.txt"
braile = File.new("./texts/braile/#{file_name}", "w")
braile.write(translated_words)



# text = "andrew shafer"
#
# p text.split("")
#
# array = text.split("").map do |char|
#   dictionary[char]
# end
#
# p array
#
# 3.times do |index|
#   array.each do |thing|
#     print thing[index]
#   end
#   print "\n"
# end
#
# array.each do |char|
#   print dictionary.key(char)
# end
