require "./lib_hash/hashset"
require "rspec/expectations"

describe "HashSet" do

  describe "HashSet#initialize" do

  end #of initialize

  describe "HashSet#insert" do

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

    xit "runs faster than linear time on average" do
    end

  end #of include?



end # of HashSet
