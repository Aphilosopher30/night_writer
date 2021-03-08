require './lib/line_alpha'
require './lib/line_brail'
require './lib/read_write'

input = ARGV[0]
output = ARGV[1]

text = ReadWrite.new(input)

if text.is_brail?
  process = text.process_text_brail
  object = LineAlpha
else
  process = text.process_text_alpha
  object = LineBrail
end

all_text = text.translate_line(process)

breaks = text.designate_line_brakes(all_text)

printable = []
for line in breaks
  line = object.new(line)
  printable << line.generate_printable_line
end
x = printable.join


braile = File.new("./texts/braile/#{output}", "w")
braile.write(x)
