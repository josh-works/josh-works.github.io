# class Bicycle, p 107
class Bicycle
  attr_reader :size, :tape_color, :style, :front_shock, 
              :rear_shock
  
  def initialize(args)
    @style = args[:style]
    @size = args[:size]
    @tape_color = args[:tape_color]
    @front_shock = args[:front_shock]
    @rear_shock = args[:rear_shock]
  end
  
  def spares
    if style == :road
      { chain: '10-speed',
        tire_sice: '23',
        tape_color: tape_color
      }
    else
      {
        chain: '10-speed',
        tire_size: '2.1',
        rear_shock: rear_shock
      }
    end
  end
end

# puts each of the following in your terminal
# bike = Bicycle.new(size: 'M', tape_color: 'red')
# bike.size
# bike.spares

## Not sure what this is from either

# class Bicycle
# end
# 
# 
# class MountainBike < Bicycle
#   attr_reader :size, :tape_color, :front_shock, :rear_shock
#   def initialize(args)
#     @size         = args[:size]
#     @tape_color   = args[:tape_color]
#     @front_shock  = args[:front_shock]
#     @rear_shock   = args[:rear_shock]
#   end
# 
#   def spares
#     { chain:      '10-speed',
#       tire_size:  '2.1',
#       rear_shock: rear_shock
#     }
#   end
# end
# 
# class RoadBike < Bicycle
#   attr_reader :size, :tape_color
#   def initialize(args)
#     @size       = args[:size]
#     @tape_color = args[:tape_color]
#   end
# 
#   def spares
#     { chain:      '10-speed',
#       tire_size:  '23',
#       tape_color: tape_color }
#   end
# end


## Not sure what below code is from

# class Bicycle
#   attr_reader :tire_size, :chain, :size
#   def initialize(args={})
#     @tire_size   = args[:tire_size]  || default_tire_size
#     @chain       = args[:chain]      || default_chain
#     @size        = args[:size]
#     post_initialize(args)
#   end
# 
#   def post_initialize(args)
#     nil
#   end
# 
#   def spares
#     { chain: chain,
#       tire_size: tire_size}.merge(local_spares)
#   end
# 
#   def local_spares
#     {}
#   end
# 
#   def default_tire_size
#     raise NotImplementedError,
#     "#{self.class} does not respond to: 'default_tire_size'"
#   end
# 
#   def default_chain
#     '10-speed'
#   end
# end
# 
# class MountainBike < Bicycle
#   attr_reader :front_shock, :rear_shock
#   def post_initialize(args)
#     @front_shock  = args[:front_shock] || default_front_shock
#     @rear_shock   = args[:rear_shock]  || default_rear_shock
#   end
# 
#   def default_front_shock
#     'Manitou'
#   end
# 
#   def default_rear_shock
#     "none"
#   end
# 
#   def local_spares
#     { rear_shock: rear_shock,
#       front_shock: front_shock
#     }
#   end
# 
#   def default_tire_size
#     '2.1'
#   end
# end
# 
# class RoadBike < Bicycle
#   attr_reader :tape_color
#   def post_initialize(args)
#     @tape_color = args[:tape_color]
#   end
#   def default_tire_size
#     '23'
#   end
#   def local_spares
#     { tape_color: tape_color }
#   end
# end
# 
# class RecumbantBike < Bicycle
#   attr_reader :flag
#   def post_initialize(args)
#     @flag = args[:flag]
#   end
# 
#   def local_spares
#     { flag: flag }
#   end
# 
#   def default_chain
#     'so many sporks'
#   end
# 
#   def default_tire_size
#     "tiny hand tires"
#   end
# end
# 
# 
# basic_mtb = MountainBike.new(
#   size:        'Small'
# )
# 
# fancy_mtb = MountainBike.new(
#   size:        "small",
#   front_shock: "manitou",
#   rear_shock:  "fox",
#   tire_size:   "500 gigalugs"
# )
# 
# bent = RecumbantBike.new(
#   flag: "don't tread on me",
#   size: "XXL"
# )
# 
# road = RoadBike.new(
#   size: "XL",
#   tape_color: "Red",
# )
# 
# require "pry"; binding.pry
# 
