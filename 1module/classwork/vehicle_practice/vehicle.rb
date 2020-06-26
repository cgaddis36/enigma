class Passenger
  attr_reader :name, :age
​
  def initialize(attributes)
    @name = attributes["name"]
    @age = attributes["age"]
    @driver = false
  end
end
