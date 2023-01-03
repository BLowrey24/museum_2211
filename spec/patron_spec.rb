require 'rspec'
require './lib/patron'
require './lib/exhibit'

RSpec.describe Patron do
  it 'exists' do
    patron_1 = Patron.new("Bob", 20)

    expect(patron_1).to be_an_instance_of(Patron)
  end

  it 'attributes' do
    patron_1 = Patron.new("Bob", 20)

    expect(patron_1.name).to eq("Bob")
    expect(patron_1.spending_money).to eq(20)
    expect(patron_1.interests).to eq([])
  end

  it 'can have interests' do
    patron_1 = Patron.new("Bob", 20)
    dead_sea_scrolls = Exhibit.new({name: "Dead Sea Scrolls", cost: 0})
    gems_and_minerals = Exhibit.new({name: "Gems and Minerals", cost: 0})

    patron_1.add_interest("Dead Sea Scrolls")
    patron_1.add_interest("Gems and Minerals")
        # require 'pry' ; binding.pry
    expect(patron_1.interests).to eq(["Dead Sea Scrolls", "Gems and Minerals"])
  end
end