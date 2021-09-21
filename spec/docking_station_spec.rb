require "docking_station"

describe DockingStation do
  docking_station = DockingStation.new
  it "responds to release_bike method" do
    expect(docking_station).to respond_to(:release_bike)
  end
end