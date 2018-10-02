# testing the docking station
require 'docking_station'
require 'bike'

describe DockingStation do
  it { is_expected.to respond_to :release_bike }

  it 'runs method to release bike' do
    bike = subject.release_bike
    expect(bike).to eq :working?
  end
end
