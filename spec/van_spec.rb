require 'van'

describe Van do
  let(:bike) {double("Bike", :working? => false)}
  van = Van.new
  it 'can store bikes' do
    expect(van.van_storage).to be_a Array
  end
  #let(:docking_station) {double("Docking station")}
  context 'it collects bikes and stores them in the van' do
    let(:docking_station) {double("Docking station")}
    it 'collects 1 bike' do
      van.collect(bike)
      expect(van.van_storage.length).to eq(1)
    end
  end
  let(:garage) {double("Garage")}
  context 'it drops off broken bikes at a garage' do
    
end