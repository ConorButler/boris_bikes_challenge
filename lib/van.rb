class Van
  attr_reader :van_storage
  def initialize
    @van_storage = []
  end
  def collect(bikes)
    bikes.each do |bike|
      @van_storage << bike unless bike.working?
    end
  end
end