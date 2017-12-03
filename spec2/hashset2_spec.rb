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
    expect(mySpecialHashset.contain(9)).to eq(false)
  end

  it "shrinks the set when removing an element that exists in the set" do
    mySpecialHashset = HashSet2.new()
    mySpecialHashset.add(9)
    mySpecialHashset.remove(9)
    expect(mySpecialHashset.size).to eq(0)
  end

  it "does not add an element when removing an element that does not exist in the set" do
    mySpecialHashset = HashSet2.new()
    mySpecialHashset.remove(10)
    expect(mySpecialHashset.contain(10)).to eq(false)
  end

  it "does not shrink the set when removing an element that does not exist in the set" do
    mySpecialHashset = HashSet2.new()
    mySpecialHashset.remove(10)
    expect(mySpecialHashset.size).to eq(0)
  end

  it "is equivalent to another set with the same size" do
    set1 = HashSet2.new()
    set2 = HashSet2.new()
    expect(set1.equals(set2)).to eq(true)
  end

  it "is not equivalent to another set with different size" do
    set1 = HashSet2.new()
    set2 = HashSet2.new()
    set2.add(1)
    expect(set1.equals(set2)).to eq(false)
  end

  it "is equivalent to another set with the same elements" do
    set1 = HashSet2.new()
    set1.add(1)
    set2 = HashSet2.new()
    set2.add(1)
    expect(set1.equals(set2)).to eq(true)
  end

  it "is not equivalent to another set with the different elements" do
    set1 = HashSet2.new()
    set1.add(1)
    set2 = HashSet2.new()
    set2.add(2)
    expect(set1.equals(set2)).to eq(false)
  end

  it "adds an empty collection to the set" do
    set1 = HashSet2.new()
    set1.addAll([])
    expect(set1.size).to eq(0)
  end

  it "adds a collection with one element to the set" do
    set1 = HashSet2.new()
    set1.addAll([1])
    expect(set1.size).to eq(1)
  end

  it "does not change when empty collection is removed" do
    set1 = HashSet2.new()
    set1.removeAll([])
    expect(set1.size).to eq(0)
  end

  it "does not change when collection is removed from empty set" do
    set1 = HashSet2.new()
    set1.removeAll([1])
    expect(set1.size).to eq(0)
  end

  it "removes the elements in a collection if they exist in the set" do
    set1 = HashSet2.new()
    set1.add(1)
    set1.removeAll([1])
    expect(set1.size).to eq(0)
  end

  it "does not change the set if elements in a collection do not exist in the set" do
    set1 = HashSet2.new()
    set1.add(1)
    set1.removeAll([2])
    expect(set1.size).to eq(1)
  end

  it "can be cleared" do
    set1 = HashSet2.new()
    set1.clear
    expect(set1.size).to eq(0)
  end

  it "results in size 0 when clear" do
    set1 = HashSet2.new()
    set1.add(1)
    set1.clear
    expect(set1.size).to eq(0)
  end

  it "results in empty set when clear" do
    set1 = HashSet2.new()
    set1.add(1)
    set1.clear
    expect(set1.contain(1)).to eq(false)
  end

  it "should be empty when nothing added to the set" do
    set1 = HashSet2.new()
    expect(set1.isEmpty).to eq(true)
  end

  it "should not be empty when something added to the set" do
    set1 = HashSet2.new()
    set1.add(1)
    expect(set1.isEmpty).to eq(false)
  end

  it "returns true if both the collection and set are empty" do
    set1 = HashSet2.new()
    expect(set1.containAll([])).to eq(true)
  end

  it "returns false if it does not contains all items in a non-empty collection" do
    set1 = HashSet2.new()
    expect(set1.containAll([1])).to eq(false)
  end

  it "returns true if it contains all items in a non-empty collection" do
    set1 = HashSet2.new()
    set1.add(1)
    expect(set1.containAll([1])).to eq(true)
  end




end #HashSet2