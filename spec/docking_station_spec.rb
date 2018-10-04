# testing the docking station
require 'docking_station'

describe DockingStation do
  it { is_expected.to respond_to :release_bike }

  describe '#release_bike' do
    it 'release bike' do
      bike = Bike.new
      subject.return_bike(bike)
      expect(subject.release_bike).to eq bike
    end
    it 'raises an error when there are no bikes available' do
      expect { subject.release_bike }.to raise_error 'No bikes available'
    end
  end

  describe '#return_bike' do
    it 'test when station has 20 bikes' do
      DockingStation::DEFAULT_CAPACITY.times {subject.return_bike Bike.new }
      expect { subject.return_bike Bike.new }.to raise_error 'Station full'
    end
  end

  it 'returns docked bike' do
    bike = Bike.new

    expect(subject.return_bike(bike)).to eq [bike]
  end

  it {is_expected.to respond_to(:return_bike).with(1).argument }
end
