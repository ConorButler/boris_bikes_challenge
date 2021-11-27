require "docking_station"

describe DockingStation do
  docking_station = DockingStation.new(1)
  let(:bike) {double("Bike", :working? => true)}

  it "responds to release_bike method" do
    expect(docking_station).to respond_to(:release_bike)
  end

  it "user gets a bike and the bike works" do
    allow(bike).to receive(:working?).and_return(true)
    expect(bike.working?).to eq true
  end

  it "user docks bike and it is stored in docking station" do    
    docking_station.dock(bike)
    expect(docking_station.docked_bikes).to include bike
  end

  empty_docking_station = DockingStation.new
  it "an error is raised if the user tries to release_bike and there are none available" do
    expect{empty_docking_station.release_bike}.to raise_error "error no bikes"
  end

  it "raises error when trying to dock a bike at a station that is full" do
    expect{docking_station.dock(bike)}.to raise_error "docking station full"
  end

  full_docking_station = DockingStation.new
  it "a docking station has a capacity of 20 bikes" do
    expect{20.times{full_docking_station.dock(bike)}}.not_to raise_error
    expect(full_docking_station.capacity).to eq 20
  end
  
  context "broken bikes" do
    let(:docking_station_with_broken_bike) { DockingStation.new }
    let(:bike) {double("Bike", :working? => true)}
    before(:each) {
      allow(bike).to receive(:working?).and_return(false)
      docking_station_with_broken_bike.dock(bike, false)
    }
    
    it "the user can report a broken bike when docking" do
      expect(bike.working?).to eq false
    end
    
    it "broken bikes cannot be released from the docking station" do
      expect{docking_station_with_broken_bike.release_bike}.to raise_error "bike not working"
    end
  end

end