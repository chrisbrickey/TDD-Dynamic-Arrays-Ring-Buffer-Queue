require "./lib_hash/hashing"
require "rspec/expectations"

describe "Hashing Functions" do

  describe "Fixnum#my_hash" do

    before(:all) do
      subject = 5
    end

    it "should return an integer" do
      p subject.my_hash
      expect(subject.my_hash).to be_a(Integer)
    end
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
