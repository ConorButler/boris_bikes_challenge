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
    #docking_station.attr_reader(:docked_bikes).should include @bike
  end
end