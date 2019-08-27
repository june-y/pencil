module Paper
  attr_accessor :content,:limit


  def self.set_paper_size(paper_limit)
    @limit = paper_limit
  end




  def self.set_text(input)
    @content = input

  end

  def self.read()
    puts @content
  end

end

#ruled_note = Paper.new(100)
Paper.read()
Paper.set_text("Butcher Bill")

Paper::set_text("Butcher Bill")
Paper.read()
