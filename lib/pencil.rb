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
      on_paper = @on_paper
      return @on_paper
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

  def edit_paper(string_to_add,on_paper)
    str2_arr = on_paper.split('')
    str1_arr = string_to_add.split('')
    input_count = string_to_add.length
    starting_position = on_paper.enum_for(:scan, /\s{2,}/).map { Regexp.last_match.begin(0) }
    starting_index = (starting_position.join.to_i) +1 #for buffer ws
    word_size = input_count
    counter = 0
    str2_arr[starting_index..-1].each do |char|
        break if (counter == word_size)
          if char.include?(" ") == true
            char.replace(str1_arr[counter])
          else
            char.replace('@')
          end #if else
          counter += 1
      end #do
      final = str2_arr.join('')
      @logger.info("Final string is #{final}")
      return final
  end


#what determines the final size of paper?


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
#write1 = numbertwo.write("    bird",paper)
#erase1 = numbertwo.use_eraser("ird",write1)
#erase2 = numbertwo.use_eraser("ird",erase1)
paper2 = "An       a day keeps the doctor away"
#numbertwo.edit_paper("onion",paper2)
#p "****"
#numbertwo.edit_paper("oniooonnn",paper2)
#p edit1
numbertwo.edit_paper("artichoke",paper2)
numbertwo.edit_paper("onion", paper2)
