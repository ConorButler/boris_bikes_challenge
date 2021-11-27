class Van
  attr_reader :van_storage

  def initialize 
    @van_storage = []
  end

  def collect_broken_bikes(bikes)
    # broken bikes are at the end of the array in DockingStation
    i = -1
    until bikes[i].working?
      @van_storage << bikes[i]
      i -= 1
    end
  end

  def collect_working_bikes(bikes)
    # working bikes are at the end of the array in DockingStation
    i = 0
    while bikes[i].working?
      @van_storage << bikes[i]
      i += 1
    end
  end

end