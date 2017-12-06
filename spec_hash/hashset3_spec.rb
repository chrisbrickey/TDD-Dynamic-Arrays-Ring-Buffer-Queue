require 'rspec'
require_relative '../lib2/hash_set3'

describe 'HashSet3' do

  it "is empty at first" do
    set1 = Set.new
    expect(set1.isEmpty()).to eq(true)
  end

  it "is not empty when the items have been added to the set" do
    set1 = Set.new
    set1.add(1)
    expect(set1.isEmpty).to eq(false)
  end

  it "removes an element when it exists in the set" do
    set1 = Set.new
    set1.add(1)
    set1.remove(1)
    expect(set1.isEmpty).to eq(true)
  end

  it "returns false if the set has items in it after remove is called" do
    set1 = Set.new
    set1.add(1)
    set1.remove(2)
    expect(set1.isEmpty).to eq(false)
  end

  it "returns false if the set has items in it an element is removed" do
    set1 = Set.new
    set1.add(1)
    set1.add(2)
    set1.remove(2)
    expect(set1.isEmpty).to eq(false)
  end

  it "does not hold duplicate items" do
    set1 = Set.new
    set1.add(1)
    set1.add(1)
    expect(set1.size).to eq(1)
  end

  it "does not remove items twice" do
    set1 = Set.new
    set1.add(1)
    set1.remove(1)
    set1.remove(1)
    expect(set1.size).to eq(0)
  end

  it "expands in size" do
    set1 = Set.new
    set1.add(1)
    set1.add(2)
    set1.add(3)
    expect(set1.size).to eq(3)
  end

  it "expands in contents" do
    set1 = Set.new
    set1.add(1)
    set1.add(2)
    set1.add(3)
    expect(set1.contain(1)).to eq(true)
    expect(set1.contain(2)).to eq(true)
    expect(set1.contain(3)).to eq(true)
  end

  it "does not report contained items that are not in the set" do
    set1 = Set.new
    expect(set1.contain(1)).to eq(false)
  end




end
