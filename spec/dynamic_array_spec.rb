require "dynamic_array"

# I've listed the public methods required for my API and am writing tests for each of those methods prior to implementing them

describe "DynamicArray#initialize" do
  it "starts out empty" do
    subject = DynamicArray.new
    expect(subject.length).to eq(0)
  end
end

describe "DynamicArray#[]" do

  it "returns an item when given a negative index in bounds" do
    subject = DynamicArray.new
    subject.push("apple")
    expect(subject[-1]).to eq("apple")
  end

  it "raises error when given a negative index out of bounds" do
    subject = DynamicArray.new
    subject.push("apple")
    expect do
      subject[-2]
    end.to raise_error("index out of bounds")
  end

end

describe "DynamicArray#[]=" do

  it "changes an item at a given index" do
    subject = DynamicArray.new
    subject.push("apple")
    subject[0] = "orange"
    expect(subject[0]).to eq("orange")
  end

  it "raises error when asked to change an item at a given positive index out of bounds" do
    subject = DynamicArray.new
    expect do
      subject[0] = "apple"
    end.to raise_error("index out of bounds")
  end

  it "raises error when asked to change an item at a given negative index out of bounds" do
    subject = DynamicArray.new
    expect do
      subject[-1] = "apple"
    end.to raise_error("index out of bounds")
  end

end


# Ultimately, I'd like to design the DynamicArray API
# ...such that all methods run at constant time complexity (on average).
# To test time complexity, I should be testing the actual time complexities experienced in this environment
# ...by comparing my API method run times to methods with linear time complexity
# If, instead, I tested whether or not a 'resize' helper method is called (doubles size of underlying array to acheive constant time on avg),
# ...then I'm testing the implementation not the behavior. That misses the point of TDD.


describe "DynamicArray#push" do

  it "accepts a new item" do
    subject = DynamicArray.new
    subject.push("apple")
    expect(subject.length).to eq(1)
  end

  it "can retrieve the item that was added to it" do
    subject = DynamicArray.new
    subject.push("apple")
    expect(subject[0]).to eq("apple")
  end

end

describe "DynamicArray#pop" do

  it "can remove an item and have correct length" do
    subject = DynamicArray.new
    subject.push("apple")
    subject.pop
    expect(subject.length).to eq(0)
  end

  it "can remove an item from a larger array and have correct length" do
    subject = DynamicArray.new
    subject.push("apple")
    subject.push("orange")
    subject.pop
    expect(subject.length).to eq(1)
  end

  it "can remove an item and no longer return that item" do
    subject = DynamicArray.new
    subject.push("apple")
    subject.pop
    expect do
      subject[0]
    end.to raise_error("index out of bounds")
  end

  it "returns the item removed by the pop method" do
    subject = DynamicArray.new
    subject.push("apple")
    result = subject.pop
    expect(result).to eq("apple")
  end

end

describe "DynamicArray#shift" do
end

describe "DynamicArray#unshift" do
end
