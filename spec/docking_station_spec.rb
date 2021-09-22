require "docking_station"

describe DockingStation do
  docking_station = DockingStation.new
  it "responds to release_bike method" do
    expect(docking_station).to respond_to(:release_bike)
  end
  
  bike = docking_station.release_bike
  it "user gets a bike and the bike works" do
    expect(bike).to be_a Bike
    expect(bike.working?).to eq true
  end

  it "user docks bike and it is stored in docking station" do
    expect(docking_station).to respond_to(:dock).with(1).argument
  
    docking_station.dock(bike)
    #using the attr_reader we are able to read the instance variables from outside of the object
    expect(docking_station.docked_bikes).to include bike
  end
end