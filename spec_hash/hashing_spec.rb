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
      expect(0.my_hash.to_s.length).to be > 1
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

    it "should return an integer" do
      expect(subject.my_hash).to be_a(Integer)
    end

    it "should hash in a deterministic way" do
      expect("hello".my_hash).to eq("hello".my_hash)
    end

    it "should handle empty string" do
      expect("".my_hash.to_s.length).to be > 1
    end

    it "should not return similar results for similar strings" do
      forward, backward = ["hello", "olleh"]
      a, b = ["hello", "iello"]
      expect(forward.my_hash.to_s.reverse).not_to eq(backward.to_s.my_hash)
      expect(a.my_hash).not_to eq(b.my_hash)
    end

  end # of String


  describe "Array#my_hash" do

    it "should return an integer" do
      expect([1, "hello", 3].my_hash).to be_a(Integer)
    end

    it "should hash in a deterministic way" do
      expect([1, 2, "oh yeah"].my_hash).to eq([1, 2, "oh yeah"].my_hash)
    end

    it "should handle an empty array" do
      expect([].my_hash.to_s.length).to be > 1
    end

    it "should handle multi-dimensional arrays" do
      expect([[9, 8, 7], 2, "world", [3, "what"]].my_hash).to be_a(Integer)
    end

    it "should not return a negative integer" do
      expect([-96, 3, -1008].my_hash).to be > 0
      expect([-96, -3, -1008].my_hash).to be > 0
    end

    it "should not return similar results for similar arrays" do
      forward, backward = [[1, 2, 3],[3, 2, 1]]
      positive, negative = [[1, 2, 3], [-1, -2, -3]]
      expect(forward.my_hash.to_s.reverse).not_to eq(backward.to_s.my_hash)
      expect(positive.my_hash).not_to eq(negative.my_hash)
    end

  end # of Array


  describe "Hash#my_hash" do

    it "should return an integer" do
      x = { "a" => 5, "b" => [5, 6, 9] }
      expect(x.my_hash).to be_a(Integer)
    end

    it "should hash in a deterministic way" do
      x = { "a" => 5, "b" => [5, 6, 9] }
      expect(x.my_hash).to eq(x.my_hash)
    end

    it "should handle an empty hash" do
      expect({}.my_hash.to_s.length).to be > 1
    end

    it "should not return a negative integer" do
      expect({-96 => :l, 3 => "hello", -1008 => 5 }.my_hash).to be > 0
      expect({-96 => :l, -3 => "hello", -1008 => 5 }.my_hash).to be > 0
    end

    it "should not return similar results for similar hashes" do
      positive, negative = [{ 1 => "a", 2 => "a", 3 => "a" }, { -1 => "a", -2 => "a", -3 => "a" }]
      expect(positive.my_hash).not_to eq(negative.my_hash)
    end

  end # of Hash

end # of hashing
