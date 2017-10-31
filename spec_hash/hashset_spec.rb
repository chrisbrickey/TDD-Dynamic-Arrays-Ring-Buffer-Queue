require "./lib_hash/hashset"
require "./lib_hash/hashing"
require "rspec/expectations"

describe HashSet do

  before(:all) do
    subject = HashSet.new
  end

  describe "HashSet#initialize" do

    it "initializes to length of 4" do
      expect(subject.size).to eq(4)
    end

  end #of initialize

  describe "HashSet#insert" do

    it "inserts an element" do
      element = "a"
      desired_position = element.my_hash % 4
      subject.insert(element)

    p subject.store

      expect(subject.store[desired_position][0]).to eq(element)
    end

    it "inserts an element regardless of type" do
      el1, el2, el3, el4 = 0, "", [], {}
      el5 = -73
      el6 = 42
      el7 = [5, "a", -700]
      el8 = { "a" => [4, 5, 6], "b" => "hello" }



      [el1, el2, el3, el4, el5, el6, el7, el8].each do |el|
        desired_position = el.my_hash % subject.size
        subject.insert(el)
        expect(subject.store[desired_position].include?(el)).to be(true)

        p subject.store
      end

    end

    it "manages collisions; holds multiple elements inserted at the same position" do
      this_size = subject.size
      position = nil
      el1 = "a"
      el1_position = el1.my_hash % this_size
      el2 = nil

      ("b".."z").each do |letter|
        letter_position = letter.my_hash % this_size
        if el1_position == letter_position
          position = el1_position
          el2 = letter
          break
        end
      end

      # print el1
      # print el1.my_hash % this_size
      # print el2
      # print el2.my_hash % this_size
      # print el1_position

      subject.insert(el1)
      subject.insert(el2)
      expect(subject.store[position].include?(el1)).to be(true)
      expect(subject.store[position].include?(el2)).to be(true)
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
