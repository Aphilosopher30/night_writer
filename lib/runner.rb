

















#     def sepperate_into_lines(super_string, max_length = 20)
#       array_of_words = super_string.split
#       line_array = []
#       substring = ""
#       array_of_words.each do |next_word|
#         if substring.length + next_word.length >= max_length
#           line_array << substring
#           substring = ""
#         else
#           substring += next_word
#           substring += " "
#         end
#       end
#       line_array
#     end
#
#
#
#
#
# array_of_characters = [["a"],["b"],["c"],["d"]]
#
#
#
#
#
#
#
# skipable = ";(){}[!@#$%^&*]"
#
# read_file = "file1.txt"
# text = File.open("./texts/alpha/#{read_file}", "r")
# words = text.read.downcase.delete(skipable)
#
# new_words = ""
# words.each_char do |char|
#   if char == "\n"
#     char = " "
#   end
#   new_words += char
# end
#
# words = new_words
#
# word_lines = sepperate_into_lines(words)
# puts word_lines
#
# word_lines.each
#   array = words.split("").map! do |char|
#     dictionary[char]
#   end
#
# translated_words = ""
# 3.times do |index|
#   array.each do |part|
#     pair = part[index]
#     translated_words += pair
#   end
#   translated_words += "\n"
# end
#
#
#
#
#
# file_name = "braile.txt"
# braile = File.new("./texts/braile/#{file_name}", "w")
# braile.write(translated_words)
#
#
#
# # text = "andrew shafer"
# #
# # p text.split("")
# #
# # array = text.split("").map do |char|
# #   dictionary[char]
# # end
# #
# # p array
# #
# # 3.times do |index|
# #   array.each do |thing|
# #     print thing[index]
# #   end
# #   print "\n"
# # end
# #
# # array.each do |char|
# #   print dictionary.key(char)
# # end
