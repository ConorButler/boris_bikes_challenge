class DockingStation

  #attr_reader gives you the reference that you can use to refer to instance variables from outside of the class
  attr_reader :docked_bikes, :capacity

  def initialize(capacity = 20)
    # special method that initialises the variable below when an instance of DockingStation is created
    @docked_bikes = []
    @capacity = capacity
  end

  def release_bike
    raise "error no bikes" unless !@docked_bikes.empty?
    @docked_bikes.shift
  end

  def dock(bike)
    raise "docking station full" unless @docked_bikes.count < @capacity
    @docked_bikes << bike
  end

end