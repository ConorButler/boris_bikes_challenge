class Van
  attr_reader :van_storage
  def initialize
    @van_storage = []
  end
  def collect(bike)
    @van_storage << bike
  end
end