require "./lib_hash/hashset_fast"
require "./lib_hash/hashset_slow"
require "./lib_hash/hashing"
require "rspec/expectations"

describe HashSetFast do

  before(:all) do
    subject = HashSetFast.new
  end

  describe "HashSetFast#initialize" do

    it "initializes to length of 4" do
      expect(subject.size).to eq(4)
    end

  end #of initialize

  describe "HashSetFast#insert" do

    it "inserts an element" do
      element = "a"
      subject.insert(element)
      expect(subject.include?(element)).to be(true)
    end

    it "inserts an element regardless of type" do
      el1, el2, el3, el4 = 0, "", [], {}
      el5 = -73
      el6 = 42
      el7 = [5, "a", -700]
      el8 = { "a" => [4, 5, 6], "b" => "hello" }

      [el1, el2, el3, el4, el5, el6, el7, el8].each do |el|
        subject.insert(el)
        expect(subject.include?(el)).to be(true)
      end

    end

    it "handles a large number of inputs" do
      500.times { subject.insert(rand(1000)) }  #does not throw error is implicit in this test
    end

    it "manages collisions; holds multiple elements inserted at the same position" do
      this_size = subject.size

      el1 = "a"
      position = el1.my_hash % this_size
      el2 = nil

      ("b".."z").each do |letter|
        letter_position = letter.my_hash % this_size
        if position == letter_position
          el2 = letter
          break
        end
      end

      subject.insert(el1)
      subject.insert(el2)
      expect(subject.include?(el1)).to be(true)
      expect(subject.include?(el2)).to be(true)
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

  describe "HashSetFast#remove" do

    it "removes an element" do
      element = "a"
      subject.insert(element)
      subject.remove(element)
      expect(subject.include?(element)).to be(false)
    end

    it "removes an element regardless of type" do
      el1, el2, el3, el4 = 0, "", [], {}
      el5 = -73
      el6 = 42
      el7 = [5, "a", -700]
      el8 = { "a" => [4, 5, 6], "b" => "hello" }

      #inserting the elements
      [el1, el2, el3, el4, el5, el6, el7, el8].each do |el|
        subject.insert(el)
      end

      #removing the elements
      [el1, el2, el3, el4, el5, el6, el7, el8].each do |el|
        subject.remove(el)
        expect(subject.include?(el)).to be(false)
      end

    end

    it "manages collisions; removes only the desired element and leaves others at the same position" do
      this_size = subject.size
      el1 = "a"
      position = el1.my_hash % this_size
      el2 = nil

      ("b".."z").each do |letter|
        letter_position = letter.my_hash % this_size
        if position == letter_position
          el2 = letter
          break
        end
      end

      subject.insert(el1)
      subject.insert(el2)
      subject.remove(el1)
      expect(subject.include?(el1)).to be(false)
      expect(subject.include?(el2)).to be(true)
    end

    it "manages collisions; removes only one instance of the desired element and leaves other instances at the same position" do
      element = "apple"
      subject.insert(element)
      subject.insert(element)
      subject.remove(element)
      expect(subject.include?(element)).to be(true)
    end

    it "raises error when element to be removed is not in the HashSetFast" do
      expect do
        subject.remove("a")
      end.to raise_error("element does not exist")

      expect do
        subject.remove([])
      end.to raise_error("element does not exist")
    end



    xit "runs faster than linear time on average" do
    end

  end #of remove

  describe "HashSetFast#include?" do

    it "returns true if element is included" do
      element = "a"
      subject.insert(element)
      expect(subject.include?(element)).to eq(true)
    end

    it "returns false if element is not included" do
      expect(subject.include?("")).to eq(false)
      expect(subject.include?([])).to eq(false)
      expect(subject.include?({})).to eq(false)

      element = "a"
      subject.insert(element)
      subject.remove(element)
      expect(subject.include?(element)).to eq(false)
    end

    xit "runs faster than linear time on average" do
    end

  end #of include?



end # of HashSetFast
