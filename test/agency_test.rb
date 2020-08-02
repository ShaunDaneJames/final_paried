require 'minitest/autorun'
require 'minitest/pride'
require './lib/passenger'
require './lib/vehicle'
require './lib/agency'

class AgencyTest < Minitest::Test

  def test_it_exists_with_attributes
    agency = Agency.new({name:"Bob's gig",
                         fleet_limit: 10,
                         min_driver_age: 18})
    assert_instance_of Agency, agency
    assert_equal "Bob's gig", agency.name
    assert_equal 10, agency.fleet_limit
    assert_equal 18, agency.min_driver_age
  end

  def test_it_starts_with_no_vehicles_then_adds_until_limit_reached
    agency = Agency.new({name:"Bob's gig",
                         fleet_limit: 2,
                         min_driver_age: 18})
    car1 = Vehicle.new("2001", "Honda", "Civic")
    car2 = Vehicle.new("2002", "Honda", "Oddesy")
    car3 = Vehicle.new("2003", "Honda", "NSX")
    agency.add_car(car1)
    assert_equal [car1], agency.vehicles
    agency.add_car(car2)
    assert_equal [car1, car2], agency.vehicles
    agency.add_car(car3)
    assert_equal [car1, car2], agency.vehicles
  end

  def test_assign_max_occupancy
    agency = Agency.new({name:"Bob's gig",
                         fleet_limit: 3,
                         min_driver_age: 18})
    car1 = Vehicle.new("2001", "Honda", "Civic")
    car2 = Vehicle.new("2002", "Honda", "Oddesy")
    car3 = Vehicle.new("2003", "Honda", "NSX")
    agency.add_car(car1)
    agency.add_car(car2)
    agency.add_car(car3)

  end
end
