require "docking_station"

describe DockingStation do
  docking_station = DockingStation.new
  it "responds to release_bike method" do
    expect(docking_station).to respond_to(:release_bike)
  end
  
  it "user gets a bike and the bike works" do
    bike = docking_station.release_bike
    expect(bike).to be_a Bike
    expect(bike.working?).to eq true
  end
end