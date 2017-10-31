require "./lib_hash/hashset"
require "./lib_hash/hashing"
require "rspec/expectations"

describe HashSet do

  before(:all) do
    subject = HashSet.new
  end

  describe "HashSet#initialize" do

    # before(:all) do
    #   subject = HashSet.new
    # end

    it "initializes to length of 4" do
      expect(subject.size).to eq(4)
    end

  end #of initialize

  describe "HashSet#insert" do

    it "inserts an element" do
      element = "a"
      desired_position = element.my_hash % 4
      subject.insert(element)
      expect(subject[desired_position]).to be(element)
    end

    xit "inserts an element regardless of type" do

    end

    xit "runs faster than linear time on average" do
      # slow_subject = SlowDynamicArray.new
      # start_time_for_slow_array = Time.now
      # 5000.times { slow_subject.push(rand(10)) }
      # elapsed_time_for_slow_array = Time.now - start_time_for_slow_array
      #
      # start_time_for_fast_array = Time.now
      # 5000.times { subject.push(rand(10)) }
      # elapsed_time_for_fast_array = Time.now - start_time_for_fast_array
      #
      # expect(elapsed_time_for_fast_array).to be < (elapsed_time_for_slow_array / 100)
    end
  end #of insert

  describe "HashSet#remove" do

    xit "runs faster than linear time on average" do
    end

  end #of remove

  describe "HashSet#include?" do

    it "returns true if element is included" do
    end

    it "returns false if element is not included" do
    end

    xit "runs faster than linear time on average" do
    end

  end #of include?



end # of HashSet
