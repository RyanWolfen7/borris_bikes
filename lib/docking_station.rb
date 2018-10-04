# creating file for docking station class
require_relative 'bike'

class DockingStation

  attr_accessor :bike

  def release_bike
    fail 'No bikes available' unless @bike
    @bike
  end

  def return_bike(bike)
    fail 'Station Full' unless station.full
    @bike = bike
  end

  

end
