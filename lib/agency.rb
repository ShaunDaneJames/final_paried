class Agency
  attr_reader :name,
              :fleet_limit,
              :min_driver_age,
              :vehicles

  def initialize(data)
    @name = data[:name]
    @fleet_limit = data[:fleet_limit]
    @min_driver_age = data[:min_driver_age]
    @vehicles = []
  end

  def add_car(car)
    @vehicles << car if @vehicles.count < @fleet_limit
  end


end
