require './lib/braille_text'
require './lib/alpha_text'
require './lib/read_write'

input = ARGV[0]
output = ARGV[1]

raw_text = ReadWrite.new(input)

if raw_text.is_brail?
  text = BrailleText.new(raw_text.file)
else
  text = AlphaText.new(raw_text.file)
end

translation = text.printable_translation

translated_doc = File.new("./texts/#{output}", "w")
translated_doc.write(translation)

puts "Created '#{output}' containing #{text.character_list.length} characters."
