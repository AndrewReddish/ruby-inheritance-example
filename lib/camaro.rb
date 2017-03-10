require_relative 'car'

class Camaro < Car
  def initialize
    super
    @brand = 'Chevy'
    @max_speed = 200
  end
end
