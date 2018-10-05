# testing the docking station
require 'docking_station'

describe DockingStation do
  it { is_expected.to respond_to :release_bike }

  describe '#release_bike' do
    it 'release bike' do
      bike = Bike.new
      subject.dock(bike)
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

  describe '#init' do
    it "tests if capacity can be changed" do
    station = DockingStation.new(50)
    expect(station.capacity).to eq 50
    end

    it "tests default capacity" do
    station = DockingStation.new
    expect(station.capacity).to eq DockingStation::DEFAULT_CAPACITY
    end

    it 'has a variable capacity' do
      docking_station = DockingStation.new(50)
      50.times { docking_station.return_bike Bike.new }
      expect{ docking_station.return_bike Bike.new }.to raise_error 'Station full'
  end

  end

  it 'release bike' do
    bike = subject.release_bike
    expect(bike).to be_working
  end
  it 'returns docked bike' do
    bike = Bike.new

    expect(subject.return_bike(bike)).to eq [bike]
  end

  it {is_expected.to respond_to(:return_bike).with(1).argument }
end
