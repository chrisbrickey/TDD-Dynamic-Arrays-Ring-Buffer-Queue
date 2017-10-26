require "./lib_hash/hashing"
require "rspec/expectations"

describe "Hashing Functions" do

  describe "Array#hash" do

    before(:all) do
      subject = [1, 2, 3]
    end

    it "should return an integer" do
      expect(subject.hash).to be_a(Integer)
    end
  end

end # of hashing
