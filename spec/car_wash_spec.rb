require_relative '../car_wash.rb'

describe 'CarWash' do
  let(:carwash) { CarWash.new(2) }
  let(:car1) { Car.new('A') }
  let(:car2) { Car.new('B') }
  let(:car3) { Car.new('C') }
  let(:car4) { Car.new('D') }
  let(:car5) { Car.new('E') }
  let(:car6) { Car.new('F') }

  it 'should be initialized with n*n size matrix' do
    expect(carwash.space.to_a).to match_array([[nil, nil], [nil, nil]])
  end

  describe 'Enqueuing' do
    context 'success' do
      it 'should enqueue new car to first empty spot' do
        carwash.enqueue(car1)
        expect(carwash.space.to_a).to match_array([[car1, nil], [nil, nil]])
      end
    end

    context 'failed' do
      it 'should not accept more car if full' do
        carwash.enqueue(car1)
        carwash.enqueue(car2)
        carwash.enqueue(car3)
        carwash.enqueue(car4)
        expect(carwash.enqueue(car5)).to eq('parking space is full')
      end

      it 'should not accept argument not Car' do
        expect(carwash.enqueue('A')).to eq('object is not a car!')
      end
    end
  end

  describe 'Washing car' do
    context 'success' do
      before :each do
        carwash.enqueue(car1)
        carwash.enqueue(car2)
        carwash.enqueue(car3)
        carwash.enqueue(car4)
      end
      it 'should wash car that first come' do
        expect(carwash.wash).to eq(car1)
      end

      it 'should remove the washed car from parking space' do
        carwash.wash
        expect(carwash.space).to match_array([[nil, car2], [car3, car4]])
      end

      it 'should add the washed car to washed car list' do
        carwash.wash
        expect(carwash.washed).to include(car1)
      end

      it 'should enqueue new car to the first empty space' do
        carwash.wash
        carwash.wash
        carwash.enqueue(car5)
        expect(carwash.space).to match_array([[car5, nil], [car3, car4]])
      end

      it 'should wash cars according to original sequence' do
        carwash.wash
        carwash.wash
        carwash.enqueue(car5)
        carwash.wash
        expect(carwash.space).to match_array([[car5, nil], [nil, car4]])
      end
    end

    context 'failed' do
      it 'could not wash any car if empty' do
        carwash.enqueue(car1)
        carwash.wash
        expect(carwash.wash).to eq('parking space is empty')
      end
    end
  end

  it 'should print order of the cars to be washed' do
    carwash.enqueue(car1)
    carwash.enqueue(car2)
    carwash.enqueue(car3)
    carwash.enqueue(car4)
    expect(carwash.show_queue).to eq("The order of cars to be washed next are: A, B, C, D")
  end

  it 'should print list of cars that have been washed' do
    carwash.enqueue(car1)
    carwash.enqueue(car2)
    carwash.enqueue(car3)
    carwash.enqueue(car4)
    carwash.wash
    carwash.wash
    expect(carwash.show_washed).to eq("These cars have been washed are: A, B")
  end
end