class DockingStation
  DEFAULT_CAPACITY = 20
  #attr_reader gives you the reference that you can use to refer to instance variables from outside of the class
  attr_reader :docked_bikes, :capacity

  def initialize(capacity = DEFAULT_CAPACITY)
    # special method that initialises the variable below when an instance of DockingStation is created
    @docked_bikes = []
    @capacity = capacity
  end

  def release_bike
    raise "error no bikes" unless !@docked_bikes.empty?
    raise "bike not working" unless @docked_bikes.first.working?
    @docked_bikes.shift
  end

  def dock(bike, is_working=true)
    raise "docking station full" unless !full?
    bike.working = is_working
    bike.working? ? (@docked_bikes.unshift(bike)) : (@docked_bikes.push(bike))
  end

  private
  def full?
    @docked_bikes.count == @capacity
  end

end