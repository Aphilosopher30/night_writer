require './lib/character'

class ReadWrite
  attr_reader :file

  def initialize(file)
    @file = File.open("./texts/#{file}", "r").read
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
end
