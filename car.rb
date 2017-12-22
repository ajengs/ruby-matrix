class Car
  attr_accessor :name, :sequence
  def initialize(name)
    @name = name
  end

  def to_s
    @name
  end
end