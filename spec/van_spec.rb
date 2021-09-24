require 'van'

describe Van do
  let(:van) { Van.new }

  context 'collecting bikes' do
    let(:docking_station) {double("Docking station")}
    it 'collects 1 bike' do
      allow(docking_station).to receive(:docked_bikes).and_return(double("Bike", :working? => false))
      van.collect(docking_station.docked_bikes)
      expect(van.van_storage.length).to eq(1)
    end
    it 'collects 2 broken bikes' do
      bikes_to_collect = [double("Bike", :working? => false),
        double("Bike", :working? => true),
        double("Bike", :working? => false)]
      allow(docking_station).to receive(:docked_bikes).and_return(bikes_to_collect)
      van.collect(docking_station.docked_bikes)
      expect(van.van_storage.length).to eq(2)
    end
  end
  # let(:garage) {double("Garage")}
  # it "delivers broken bikes to garage" do
  #   allow(garage).to receive(:garage_storage)
    
  #   van.deliver
  #   expect(van.van_storage.length).to eq(0)
  #   expect(garage.garage_storage.length).to eq(2)
  # end
end

