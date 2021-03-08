class LineBrail
  attr_reader :line_array

  def initialize(line_array)
    @line_array = line_array
  end

  def generate_printable_line
    braile = ""
    3.times do |index|
      @line_array.each do |part|
        braile += part[index]
      end
      braile += "\n"
    end
    braile
  end
end
