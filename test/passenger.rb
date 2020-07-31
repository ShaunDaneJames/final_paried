require 'minitest/autorun'
require 'minitest/pride'
require './lib/passenger'

class PassengerTest < Minitest::Test

  def test_it_exists_with_attributes
    charlie = Passenger.new({"name" => "Charlie", "age" => 18})
    assert_instance_of Passenger, charlie
    assert_equal "Charlie", charlie.name
    assert_equal 18, charlie.age
  end

  def test_knows_if_adult
    charlie = Passenger.new({"name" => "Charlie", "age" => 18})
    taylor = Passenger.new({"name" => "Taylor", "age" => 12})
    assert_equal true, charlie.adult?
    assert_equal false, taylor.adult?
  end

  def test_knows_if_you_have_driven
    charlie = Passenger.new({"name" => "Charlie", "age" => 18})

    assert_equal false, charlie.driver?
    charlie.drive
    assert_equal true, charlie.driver?
  end
end
