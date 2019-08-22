module Pencil
  require 'logger'
  attr_accessor :eraser_durability,:point_durability
  @logger = Logger.new(STDOUT)


  def initialize()
  end

  def use_eraser(to_erase)
  end

  def write(to_write,on_object)
    if (to_write.respond_to?(:to_str))
    else
      @logger.error("You can only input strings")
    end
  end

  def sharpen()
  end

  def set_eraser_durability(value)
  end

  def set_point_durability(value,change)
  end

end
