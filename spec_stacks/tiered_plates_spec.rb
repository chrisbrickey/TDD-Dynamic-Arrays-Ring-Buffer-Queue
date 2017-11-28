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

    it "adds an element to the end of a larger stack" do
      subject.push("a")
      subject.push("b")
      subject.push("c")
      subject.push("d")
      expect(subject.pop).to eq("d")
    end

    it "expands as stack grows; does not write over older elements" do
      subject.push("a")
      subject.push("b")
      subject.push("c")
      subject.push("d")
      subject.push("e")
      subject.push("f")
      subject.push("g")
      expect(subject.pop).to eq("g")
      expect(subject.pop).to eq("f")
      expect(subject.pop).to eq("e")
      expect(subject.pop).to eq("d")
      expect(subject.pop).to eq("c")
      expect(subject.pop).to eq("b")
      expect(subject.pop).to eq("a")
    end

    it "recovers after stack is wiped out" do
      subject.push("a")
      subject.push("b")
      expect(subject.pop).to eq("b")
      expect(subject.pop).to eq("a")

      subject.push("c")
      subject.push("d")
      subject.push("e")
      subject.push("f")
      subject.push("g")
      expect(subject.pop).to eq("g")
      expect(subject.pop).to eq("f")
      expect(subject.pop).to eq("e")
      expect(subject.pop).to eq("d")
      expect(subject.pop).to eq("c")
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
      subject.push("d")
      subject.push("e")
      subject.push("f")
      subject.push("g")
      expect(subject.atIndex(0)).to eq("a")
      expect(subject.atIndex(1)).to eq("b")
      expect(subject.atIndex(2)).to eq("c")
      expect(subject.atIndex(3)).to eq("d")
      expect(subject.atIndex(4)).to eq("e")
      expect(subject.atIndex(5)).to eq("f")
      expect(subject.atIndex(6)).to eq("g")
    end

    it "if the index is vacant, it returns nil" do
      subject.push("a")
      subject.push("b")
      subject.push("c")
      expect(subject.atIndex(3)).to eq(nil)
    end

  end

end # of TieredPlates
