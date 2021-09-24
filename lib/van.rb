class Van
  attr_reader :van_storage
  def initialize
    @van_storage = []
  end
  def collect(bikes)
    i = -1
    until bikes[i].working?
      @van_storage << bikes[i]
      i -= 1
    end

    bikes.each do |bike|
      @van_storage << bike unless bike.working?
    end
  end
end