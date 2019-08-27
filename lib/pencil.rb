class Pencil
  #include Paper
  require 'logger'
  attr_accessor :eraser_durability,:point_durability,:pencil_length,:on_paper



  def initialize(eraser_input, point_input,length_input)
    @eraser_durability = eraser_input
    @point_durability = point_input
    @initial_point = point_input
    @pencil_length = length_input
    @logger = Logger.new(STDOUT)
  end

  def use_eraser(string_to_erase,on_paper)
    if (string_to_erase.respond_to?(:to_str))
      set_eraser_durability(string_to_erase)
      replace_with_ws(string_to_erase,on_paper)
      @logger.info("Current string is #{@on_paper}")
    elsif (@eraser_durability == 0)
      @logger.error("The eraser is worn out")
    else
      @logger.error("You can only input strings")
    end
  end

  def write(to_write,on_paper)
    if (to_write.respond_to?(:to_str))
      set_point_durability(to_write)
      paper_string = on_paper + to_write
      @on_paper = paper_string
      @logger.info("Point is #{@point_durability}")
      @logger.info("Final String is #{@on_paper}")
      return @on_paper
    else
      @logger.error("You can only input strings")
    end
  end

  def sharpen()
    if @pencil_length > 0
      @point_durability = @initial_point
      @pencil_length = @pencil_length - 1
      @logger.info("Point is #{@point_durability}, pencil length is #{@pencil_length}")
    else
      @logger.error("Pencil is out of length")
    end
  end

  def replace_with_ws(string_to_erase,on_paper)
    array_to_remove = string_to_erase.split('')
    backwards_string = on_paper.reverse
    array_to_remove.each do |char|
      backwards_string.sub!(/#{char}/,' ')
    end
    @on_paper = backwards_string.reverse
    return @on_paper
  end

  def edit_paper(on_object)

  end

  def set_eraser_durability(string_to_erase)
    remove_count = (string_to_erase.strip.length)
    @eraser_durability = @eraser_durability - remove_count
    @logger.info("Eraser has #{@eraser_durability} chars left")
  end

  def set_point_durability(to_write)
    added_array = to_write.strip.split('')
    added_array.each do |char|
      if (char =~ /[A-Z]/)
        @point_durability = @point_durability - 2
      else ()
        @point_durability = @point_durability - 1
      end
    end
    @logger.info("Point is #{@point_durability}")
    return @point_durability
  end

end

paper = "Lady bird"
#paper2 = "How much wood would a woodchuck chuck if a woodchuck could chuck wood?"
numbertwo = Pencil.new(200,50,3)
#p paper
#numbertwo.write("    bird",paper)
#numbertwo.use_eraser("ird",paper)
#numbertwo.use_eraser("chuck",paper2)
#p paper2



#create the edit fucntion
