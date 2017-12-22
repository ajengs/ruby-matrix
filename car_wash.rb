require_relative './my_matrix.rb'
require_relative './car.rb'

class CarWash
  attr_reader :space, :washed
  @@queue_no = 0

  def initialize(size)
    @space = MyMatrix.new(size, size)
    @washed = []
  end

  def enqueue(car)
    return 'object is not a car!' unless car.is_a?Car
    return 'parking space is full' if overflow?

    @@queue_no += 1
    car.sequence = @@queue_no
    
    empty_spot = @space.address(nil)
    @space[empty_spot[0], empty_spot[1]] = car
  end

  def queue
    @space.to_a.flatten.compact.sort_by { |car| car.sequence }
  end

  def wash
    return 'parking space is empty' if underflow?
    
    car = queue.first
    car_spot = @space.address(car)
    
    @space[car_spot[0], car_spot[1]] = nil
    @washed << car
    car
  end

  def show_queue
    cars = queue.map { |car| car.to_s }
    "The order of cars to be washed next are: #{cars.join(', ')}"
  end

  def show_washed
    "These cars have been washed are: #{washed.join(', ')}"
  end
  private
    def overflow?
      @space.to_a.flatten.compact.size >= @space.row * @space.column
    end

    def underflow?
      @space.to_a.flatten.all? { |e| e.is_a?NilClass }
    end
end
