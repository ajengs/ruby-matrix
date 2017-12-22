require_relative '../car.rb'

describe 'Car' do
  let(:car) { Car.new('A') }
  
  it 'should initialize Car with a name' do
    expect(car.name).to eq('A')
  end

  it 'should print its name' do
    expect(car.to_s).to eq('A')
  end
end