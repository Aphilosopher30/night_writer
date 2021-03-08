require'./lib/line_brail'
require'./lib/character'

class AlphaText
  attr_reader :character_list

  def initialize(input)
    @skipable = ";(){}[!@$%^&*]"
    @character_list = process_text(input)
  end


  def process_text(text)
    readable = remove_unreadable(text)
    oneline = replace_new_line(readable)
    oneline.split("")
  end

  def replace_new_line(words)
    new_words = ""
    words.each_char do |char|
      if char == "\n"
        char = " "
      end
      new_words += char
    end
    new_words
  end

  def remove_unreadable(input)
    input.downcase.delete(@skipable)
  end

  def translate_text(text_list)
    translation = text_list.map do |element|
      letter = Character.new(element)
      letter.translate
    end
    translation
  end

  def designate_line_brakes(text, max_line_length=40)
    lines =[]
    last = 0
    start = 0
    while start < text.length
      last = max_line_length
      final_index = start+last
      until text[final_index] == " " || text[final_index] == ["..","..",".."] || text[final_index] == nil
        last -=1
        final_index = start+last
      end
      lines << text.slice(start, last)
      start += last +1
    end
    lines
  end

  def printable_translation
    printable = []
    translated = translate_text(@character_list)
    breaks = designate_line_brakes(translated)
    breaks.each do |line|
      line = LineBrail.new(line)
      printable << line.generate_printable_line
    end
    printable.join
  end

end
