require "./lib_stacks/tiered_plates"
require "rspec/expectations"

describe TieredPlates do

  before(:all) do
    subject = TieredPlates.new
  end

  describe "#push" do

    it "adds an element to the end" do
      subject.push("a")
      expect(subject.pop).to eq("a")
    end

  end

  describe "#pop" do

    it "removes an element from the end (same side as push)" do
      subject.push("a")
      subject.push("b")
      subject.push("c")
      expect(subject.pop).to eq("c")
    end

    it "if the stacks are empty, raises error" do
      expect do
        subject.pop
      end.to raise_error("stacks are empty")
    end

  end

  describe "#atIndex" do

    it "if the index is occupied, it returns the element at that index" do
      subject.push("a")
      subject.push("b")
      subject.push("c")
      expect(subject.atIndex(1)).to eq("b")
    end

    it "if the index is vacant, it returns nil" do
      subject.push("a")
      subject.push("b")
      subject.push("c")
      expect(subject.atIndex(3)).to eq(nil)
    end

  end

end # of TieredPlates
