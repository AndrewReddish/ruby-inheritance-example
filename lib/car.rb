class Car
  def initialize
    @current_speed = 0
    @brand = 'unknown'
    @max_speed = 0
  end

  def accelerate # this could be made private
    @current_speed += 1
  end

  def drive
    while @current_speed < @max_speed
      accelerate
    end
    puts "maximum speed achieved"
  end
end
