require'./lib/line_alpha'
require 'pry'

class BrailleText
  attr_reader :character_list

  def initialize(input)
    @character_list = process_text(input)
  end

  def generate_lines_by_threes(text)
    lines = text.split("\n")
    lines_by_threes = []
    triplet = []
    lines.each do |line|
      triplet << line
      if triplet.length == 3
        lines_by_threes << triplet
        triplet = []
      end
    end
    lines_by_threes
  end


  def generate_all_pairs(lines_by_threes)
    all_pairs = []
    lines_by_threes.each do |triplet|
      pair_array = []
      triplet.each do |row|
        row.chars.each_slice(2) do |pair|
            part = pair.join
            pair_array << part
        end
      all_pairs << pair_array
      pair_array = []
      end
    end
    all_pairs
  end

  def create_brail_characters(all_pairs_by_threes)
    brail_array = []
    all_pairs_by_threes.each do |line|
      line[0].length.times do |index_number|
        brail_character = []
        brail_character << line[0][index_number]
        brail_character << line[1][index_number]
        brail_character << line[2][index_number]
        brail_array << brail_character
      end
    end
    brail_array
  end

  def process_text(input)
    lines_by_threes = generate_lines_by_threes(input)
    all_pairs = generate_all_pairs(lines_by_threes)

    all_pairs_by_threes = []
    all_pairs.each_slice(3) do |triple_pairs|
      all_pairs_by_threes << triple_pairs
    end

    create_brail_characters(all_pairs_by_threes)
  end

###################
  def translate_text
    trnaslation = character_list.map do |element|
      letter = Character.new(element)
      letter.translate
    end
    trnaslation
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
      start += last
    end
    lines
  end

  def printable_translation
    printable = []
    translated = translate_text
    breaks = designate_line_brakes(translated)
    breaks.each do |line|
      line = LineAlpha.new(line)
      printable << line.gerate_printable_line
    end
    printable.join
  end

end
