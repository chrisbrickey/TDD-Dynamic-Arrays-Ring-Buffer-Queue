require "./lib_hash/hashing"
require "rspec/expectations"

describe "Hashing Functions" do

  describe "Integer#my_hash" do

    it "should return an integer" do
      expect(5.my_hash).to be_a(Integer)
    end

    it "should hash in a deterministic way" do
      expect(95.my_hash).to eq(95.my_hash)
    end

    it "should handle zero" do
      expect(0.my_hash).not_to eq(0)
    end

    it "should handle negative integers" do
      expect(-34.my_hash).to be_a(Integer)
    end

    it "should not return a negative integer" do
      expect(-34.my_hash).to be > 0
      expect(104.my_hash).to be > 0
      expect(-13.my_hash).to be > 0
      expect(-1.my_hash).to be > 0
    end

    it "should not return similar results for similar numbers" do
      forward, backward = [59, 95]
      positive, negative = [-59, 59]
      expect(forward.my_hash.to_s.reverse).not_to eq(backward.to_s.my_hash)
      expect(positive.my_hash * -1).not_to eq(negative.my_hash)
      expect(positive.my_hash).not_to eq(negative.my_hash)
    end

  end # of Fixnum

  describe "String#my_hash" do

    before(:all) do
      subject = "hello"
    end

    it "should return an integer" do
      expect(subject.my_hash).to be_a(Integer)
    end

    it "should hash in a deterministic way" do
      expect("hello".my_hash).to eq("hello".my_hash)
    end

    it "should handle empty string" do
      expect("".my_hash).not_to eq("")
    end

    it "should not return similar results for similar strings" do
      forward, backward = ["hello", "olleh"]
      a, b = ["hello", "iello"]
      expect(forward.my_hash.to_s.reverse).not_to eq(backward.to_s.my_hash)
      expect(a.my_hash * -1).not_to eq(b.my_hash)
    end
  end # of String

  describe "Array#my_hash" do

    before(:all) do
      subject = [1, 2, 3]
    end

    it "should return an integer" do
      p subject.my_hash
      expect(subject.my_hash).to be_a(Integer)
    end
  end # of Array

  describe "Hash#my_hash" do

    before(:all) do
      subject = { "a" => 5, "b" => [5, 6, 9] }
    end

    it "should return an integer" do
      p subject.my_hash
      expect(subject.my_hash).to be_a(Integer)
    end
  end # of Hash

end # of hashing
