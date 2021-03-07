class ReadWrite
  attr_reader :file

  def initialize(file)
    @file = File.open("./texts/alpha/#{file}", "r").read
    @skipable = ";(){}[!@$%^&*]"
  end

  def is_brail?
    brail = true
    @file.each_char do |char|
      if char == "." || char == "0" || char == "\n"
        brail = brail
      else
        brail = false
      end
    end
    brail
  end

  def process_text_brail
    lines = @file.split("\n")
    lines_by_threes = []
    triplet = []
    lines.each do |line|
      triplet << line
      if triplet.length == 3
        lines_by_threes << triplet
        triplet = []
      end
    end

    all_pairs = []
    lines_by_threes.each do |triplet|
      pair_array = []
      triplet.each do |row|
        row.chars.each_slice(2) do |pair|
            xxx = pair.join
            pair_array << xxx
        end
      all_pairs << pair_array
      pair_array = []
      end
    end

    all_pairs_by_threes = []
    all_pairs.each_slice(3) do |triple_pairs|
      all_pairs_by_threes << triple_pairs
    end

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

  def process_text_alpha
    text = remove_unreadable
    text2 = replace_new_line(text)
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

  def remove_unreadable
    @file.downcase.delete(@skipable)
  end




end