class Passenger
  attr_reader :name,
              :age

  def initialize(data)
    @name = data["name"]
    @age = data["age"]
    @driver = false
  end

  def adult?
    @age > 17
  end

  def driver?
    @driver
  end

  def drive
    @driver = true
  end

end
