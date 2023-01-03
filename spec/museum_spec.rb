require 'rspec'
require './lib/patron'
require './lib/exhibit'
require './lib/museum'

RSpec.describe Museum do
let(:dmns) {Museum.new("Denver Museum of Nature and Science")}
let(:gems_and_minerals) {Exhibit.new({name: "Gems and Minerals", cost: 10})}
let(:dead_sea_scrolls) {Exhibit.new({name: "Dead Sea Scrolls", cost: 0})}
let(:imax) {Exhibit.new({name: "IMAX",cost: 15})}
  let(:patron_1) do
    Patron.new("Bob", 20)
  end
  let(:patron_2) do
    Patron.new("Sally", 20)
  end
  let(:patron_3) do
    Patron.new("Johnny", 5)
  end
  before do
    patron_1.add_interest("Dead Sea Scrolls")
    patron_1.add_interest("Gems and Minerals")
    
    patron_2.add_interest("IMAX")

    patron_3.add_interest("Dead Sea Scrolls")
  end
  it 'exists' do
    expect(dmns).to be_an_instance_of(Museum)
  end

  it 'has attributes' do
    expect(dmns.name).to eq("Denver Museum of Nature and Science")
    expect(dmns.exhibits).to eq([])
  end

  it 'can add exhibit' do
    dmns.add_exhibit(gems_and_minerals)
    dmns.add_exhibit(dead_sea_scrolls)
    dmns.add_exhibit(imax)
        # require 'pry' ; binding.pry
    expect(dmns.exhibits).to eq([gems_and_minerals, dead_sea_scrolls, imax])
  end

  it 'reccomend exhibits' do

    dmns.add_exhibit(gems_and_minerals)
    dmns.add_exhibit(dead_sea_scrolls)
    dmns.add_exhibit(imax)
    
    patron_1.add_interest("Dead Sea Scrolls")
    patron_1.add_interest("Gems and Minerals")
    
    patron_2.add_interest("IMAX")

    expect(dmns.reccomend_exhibits(patron_1)).to eq([gems_and_minerals, dead_sea_scrolls])
    expect(dmns.reccomend_exhibits(patron_2)).to eq([imax])
  end

  it 'can be admitted' do
    dmns = Museum.new("Denver Museum of Nature and Science")

    dmns.add_exhibit(gems_and_minerals)
    dmns.add_exhibit(dead_sea_scrolls)
    dmns.add_exhibit(imax)

    dmns.admit(patron_1)
    dmns.admit(patron_2)
    dmns.admit(patron_3)

    expect(dmns.partons).to eq([patron_1, patron_2, patron_3])
  end


end