require 'rspec'
require_relative '../lib2/hash_set2.rb'

describe 'HashSet2' do

  it 'adds an element to the HashSet' do
    mySpecialHashset = HashSet2.new()
    mySpecialHashset.add(1)
    expect(mySpecialHashset.contain(1)).to eq(true)
    expect(mySpecialHashset.contain(2)).to eq(false)
  end

  it 'adds a value other than 1 to the HashSet' do
    mySpecialHashset = HashSet2.new()
    mySpecialHashset.add(3)
    expect(mySpecialHashset.contain(3)).to eq(true)
  end

  it 'can call add more than once to add multiple values' do
    mySpecialHashset = HashSet2.new()
    mySpecialHashset.add(4)
    mySpecialHashset.add(5)
    expect(mySpecialHashset.contain(4)).to eq(true)
    expect(mySpecialHashset.contain(5)).to eq(true)
  end

  it "only holds unique values" do
    mySpecialHashset = HashSet2.new()
    mySpecialHashset.add(6)
    mySpecialHashset.add(6)
    expect(mySpecialHashset.size).to eq(1)
  end

  it "only holds unique values" do
    mySpecialHashset = HashSet2.new()
    mySpecialHashset.add(7)
    mySpecialHashset.add(8)
    expect(mySpecialHashset.size).to eq(2)
  end

  it "removes an element that exists in the set" do
    mySpecialHashset = HashSet2.new()
    mySpecialHashset.add(9)
    mySpecialHashset.remove(9)
    expect(mySpecialHashset.size).to eq(0)
    expect(mySpecialHashset.contain(9)).to eq(false)
  end

  it "does not shrink the set when removing an element that does not exist in the set" do
    mySpecialHashset = HashSet2.new()
    mySpecialHashset.remove(10)
    expect(mySpecialHashset.size).to eq(0)
    expect(mySpecialHashset.contain(10)).to eq(false)
  end



end #HashSet2