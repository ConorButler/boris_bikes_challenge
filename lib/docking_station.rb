class DockingStation

  #attr_reader gives you the reference that you can use to refer to instance variables from outside of the class
  attr_reader :docked_bikes

  def initialize
    # special method that initialises the variable below when an instance of DockingStation is created
    @docked_bikes = []
  end

  def release_bike
    Bike.new
  end

  def dock(bike)
    #adds the bike to the docked_bikes array
    @docked_bikes << bike
  end

end