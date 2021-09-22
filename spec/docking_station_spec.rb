require "docking_station"

describe DockingStation do
  docking_station = DockingStation.new(1)
  it "responds to release_bike method" do
    expect(docking_station).to respond_to(:release_bike)
  end

  first_bike = Bike.new
  docking_station.dock(first_bike)
  first_bike = docking_station.release_bike

  it "user gets a bike and the bike works" do
    expect(first_bike).to be_a Bike
    expect(first_bike.working?).to eq true
  end

  it "user docks bike and it is stored in docking station" do
    expect(docking_station).to respond_to(:dock).with(1).argument
    docking_station.dock(first_bike)
    #using the attr_reader we are able to read the instance variables from outside of the object
    expect(docking_station.docked_bikes).to include first_bike
  end

  empty_docking_station = DockingStation.new
  it "an error is raised if the user tries to release_bike and there are none available" do
    expect{empty_docking_station.release_bike}.to raise_error
  end

  #docking_station.dock(first_bike)
  second_bike = Bike.new
  it "raises error when trying to dock a bike at a station that is full" do
    expect{docking_station.dock(second_bike)}.to raise_error
  end

  full_docking_station = DockingStation.new
  it "a docking station has a capacity of 20 bikes" do
    expect{20.times{full_docking_station.dock Bike.new}}.not_to raise_error
    expect(full_docking_station.capacity).to eq 20
  end

end