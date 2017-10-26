require "./lib_hash/hashing"
require "rspec/expectations"

describe "Hashing Functions" do

  describe "Fixnum#hash" do

    before(:all) do
      subject = 5
    end

    it "should return an integer" do
      expect(subject.hash).to be_a(Integer)
    end
  end # of Fixnum

  describe "String#hash" do

    before(:all) do
      subject = "hello"
    end

    it "should return an integer" do
      expect(subject.hash).to be_a(Integer)
    end
  end # of String

  describe "Array#hash" do

    before(:all) do
      subject = [1, 2, 3]
    end

    it "should return an integer" do
      expect(subject.hash).to be_a(Integer)
    end
  end # of Array

  describe "Hash#hash" do

    before(:all) do
      subject = { "a" => 5, "b" => [5, 6, 9] }
    end

    it "should return an integer" do
      expect(subject.hash).to be_a(Integer)
    end
  end # of Hash

end # of hashing
