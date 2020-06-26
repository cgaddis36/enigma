class Unicorn
  attr_reader :color, :magical_powers
  attr_accessor :name
  def initialize(name_parameter = "", color_parameter)
    @name = name_parameter
    @color = color_parameter
    @magical_powers = []
  end

  def learn_power(name_of_power)
    @magical_powers << name_of_power
  end
end
