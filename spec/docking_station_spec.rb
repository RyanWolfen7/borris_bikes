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
    it 'raises error when full' do
      subject.return_bike(Bike.new)
      expect { subject.doc Bike.new}.to raise_error 'Docking full'
    end
  end

  it 'returns docked bike' do
    bike = Bike.new
    subject.return_bike(bike)
    expect(subject.bike).to eq bike
  end

  it {is_expected.to respond_to(:return_bike).with(1).argument }
end
