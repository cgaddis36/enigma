class Dog
  attr_accessor :name, :age, :breed
  attr_reader :dental_records, :health_records

  def initialize
    @name = name,
    @age = age,
    @breed = breed,
    @size = size,
    @dental_records = dental_records,
    @weight = health_records
  end
  def bark
    if size == "small"
      puts "Woof"
    elsif size == "medium"
      puts "ruff"
    elsif size == "large"
      puts "BARK!"
    end
  end
end

class Dog
  attr_accessor :name, :age, :breed, :dental_records, :health_records

  def initialize
    @name = name,
    @age = age,
    @breed = breed,
    @weight = weight,
    @dental_records = dental_records
    @health_records = health_records
  end

  def bark(size)
    if size == "small"
      puts "Woof"
     elsif size == "medium"
      puts "ruff"
    elsif size == "large"
    puts "BARK!"
    end
  end
end

class Dog
  def initialize(weight)
    @weight = weight
  end

end
