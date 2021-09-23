require "docking_station"

describe DockingStation do
  docking_station = DockingStation.new(1)
  it "responds to release_bike method" do
    expect(docking_station).to respond_to(:release_bike)
  end

  it "user gets a bike and the bike works" do
    expect(double(:bike).working?).to eq true
  end

  it "user docks bike and it is stored in docking station" do
    expect(docking_station).to respond_to(:dock).with(1).argument
    docking_station.dock(double(:bike))
    #using the attr_reader we are able to read the instance variables from outside of the object
    expect(docking_station.docked_bikes).to include bike
  end

  empty_docking_station = DockingStation.new
  it "an error is raised if the user tries to release_bike and there are none available" do
    expect{empty_docking_station.release_bike}.to raise_error
  end

  #docking_station.dock(first_bike)
  it "raises error when trying to dock a bike at a station that is full" do
    expect{docking_station.dock(double(:bike))}.to raise_error
  end

  full_docking_station = DockingStation.new
  it "a docking station has a capacity of 20 bikes" do
    expect{20.times{full_docking_station.dock double(:bike)}}.not_to raise_error
    expect(full_docking_station.capacity).to eq 20
  end
  
  docking_station_with_broken_bike = DockingStation.new
  it "the user can report a broken bike when docking" do
    docking_station_with_broken_bike.dock(double(:broken_bike), false)
    expect(broken_bike.working?).to eq false
  end
  
  it "broken bikes cannot be released from the docking station" do
    expect{docking_station_with_broken_bike.release_bike}.to raise_error
  end

end