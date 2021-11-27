require 'van'

describe Van do
  let(:bike1) { double("Bike1", :working? => true) }
  let(:bike2) { double("Bike2", :working? => false) }
  let(:bike3) { double("Bike3", :working? => false) }
  let(:van) { described_class.new }

  describe '.collect_broken_bikes' do
    it 'collects only broken bikes' do
      van.collect_broken_bikes([bike1, bike2, bike3])
      expect(van.van_storage.length).to eq(2)
      expect(van.van_storage).to include(bike2)
      expect(van.van_storage).to include(bike3)
      expect(van.van_storage).not_to include(bike1)
    end
  end

  describe '.collect_working_bikes' do
    it 'collects only working bikes' do
      van.collect_working_bikes([bike1, bike2, bike3])
      expect(van.van_storage.length).to eq(1)
      expect(van.van_storage).not_to include(bike2)
      expect(van.van_storage).not_to include(bike3)
      expect(van.van_storage).to include(bike1)
    end
  end
end

