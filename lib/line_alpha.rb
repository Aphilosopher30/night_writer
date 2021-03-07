class LineAlpha
  attr_reader :line_array

  def initialize(line_array)
      @line_array = line_array
  end

  def generate_printable_line
    @line_array.join + "\n"
  end

  

end
