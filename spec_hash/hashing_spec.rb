require "./lib_hash/hashing"
require "rspec/expectations"

describe "Hashing Functions" do

  describe "Integer#my_hash" do

    it "should return an integer" do
      expect(5.my_hash).to be_a(Integer)
    end

    it "should hash in a deterministic way" do
      expect(59.my_hash).not_to eq(95)
      expect(95.my_hash).to eq(95.my_hash)
    end

    it "should handle zero" do
      expect(0.my_hash).no to_eq(0)
    end

    it "should not return similar results for "

  end # of Fixnum

  describe "String#my_hash" do

    before(:all) do
      subject = "hello"
    end

    it "should return an integer" do
      p subject.my_hash
      expect(subject.my_hash).to be_a(Integer)
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
