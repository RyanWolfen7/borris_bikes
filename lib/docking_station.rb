# creating file for docking station class
require_relative 'bike'



class DockingStation

  DEFAULT_CAPACITY = 20

  def release_bike
    fail 'No bikes available' if empty?
    @arr_bikes.pop
  end

  def return_bike(bike)
    fail 'Station full' if full?
    @arr_bikes << bike
  end

  def initialize
    @arr_bikes = []
  end

  private
  def full?
     @arr_bikes.count >= DEFAULT_CAPACITY
  end

  def empty?
    @arr_bikes.empty?
  end
end
