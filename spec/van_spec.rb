require 'van'

describe Van do
  let(:bike1) { double("Bike1", :working? => true) }
  let(:bike2) { double("Bike2", :working? => false) }
  let(:bike3) { double("Bike3", :working? => false) }
  let(:van) { Van.new }

  it 'collects only broken bikes' do
    van.collect([bike1, bike2, bike3])
    expect(van.van_storage.length).to eq(2)
    expect(van.van_storage).to include(bike2)
    expect(van.van_storage).to include(bike3)
    expect(van.van_storage).not_to include(bike1)
  end
end

