require 'bike'

describe Bike do
  bike = Bike.new
  it "responds to the working? method" do
    expect(bike).to respond_to(:working?)
  end
end