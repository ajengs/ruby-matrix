require_relative './car_wash.rb'

puts 'Initialize CarWash...'
carwash = CarWash.new(3)
puts carwash.space
puts ''
puts 'Enqueuing cars...'
car1 = Car.new('A')
car2 = Car.new('B')
car3 = Car.new('C')
puts carwash.enqueue(car1)
puts carwash.enqueue(car2)
puts carwash.enqueue(car3)
puts carwash.space
puts carwash.show_queue
car4 = Car.new('D')
car5 = Car.new('E')
car6 = Car.new('F')
car7 = Car.new('G')
car8 = Car.new('H')
car9 = Car.new('I')
car10 = Car.new('J')
puts ''

puts 'Enqueuing D,E,F,G,H,I,J...'
carwash.enqueue(car4)
carwash.enqueue(car5)
carwash.enqueue(car6)
carwash.enqueue(car7)
carwash.enqueue(car8)
carwash.enqueue(car9)
puts carwash.space
puts''

puts 'Enqueue one more car when full...'
puts carwash.enqueue(car10)
puts ''

puts 'Washing cars...'
puts carwash.wash
puts carwash.wash
puts carwash.space
puts 'Enqueue one more car...'
carwash.enqueue(car10)
puts carwash.space
puts carwash.show_queue
puts ''

puts 'Washing cars...'
puts carwash.wash
puts carwash.wash
puts carwash.wash
puts carwash.space
puts ''

puts 'Enqueue one more car...'
car11 = Car.new('K')
carwash.enqueue(car11)
puts carwash.space
puts carwash.show_queue
puts carwash.show_washed
puts ''

puts 'Washing cars...'
puts carwash.wash
puts carwash.wash
puts carwash.wash
puts carwash.wash
puts carwash.space
puts carwash.wash
puts carwash.space
puts carwash.show_queue
puts carwash.show_washed
puts carwash.wash
puts carwash.wash