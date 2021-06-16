class Bicycle
end


class MountainBike < Bicycle
  attr_reader :size, :tape_color, :front_shock, :rear_shock
  def initialize(args)
    @size         = args[:size]
    @tape_color   = args[:tape_color]
    @front_shock  = args[:front_shock]
    @rear_shock   = args[:rear_shock]
  end
  
  def spares
    { chain:      '10-speed',
      tire_size:  '2.1',
      rear_shock: rear_shock
    }
  end
end

class RoadBike < Bicycle
  attr_reader :size, :tape_color
  def initialize(args)
    @size       = args[:size]
    @tape_color = args[:tape_color]
  end
  
  def spares
    { chain:      '10-speed',
      tire_size:  '23',
      tape_color: tape_color }
  end
end

require "pry"; binding.pry

puts 