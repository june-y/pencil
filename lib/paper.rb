module Paper
  attr_accessor :content

  def initialize()
    @content = ""
  end

  def set_text(input)
    @content = input
  end

  def read()
    puts @content
  end

end
