require "./lib_bst/bst"
require "rspec/expectations"

describe BinarySearchTree do

  before(:all) do
    subject = BinarySearchTree.new
  end

  describe "BinarySearchTree#insert" do

    it "inserts at the root if tree is empty" do
      expect(subject.root).to eq(nil)
      subject.insert(10)
      expect(subject.root.value).to eq(10)
    end

    it "inserts to left of root if value is less than root" do
        subject.insert(10)
        subject.insert(8)
        expect(subject.root.left.value).to eq(8)
    end

    it "inserts to right of root if value is greater than the root" do
      subject.insert(10)
      subject.insert(12)
      expect(subject.root.right.value).to eq(12)
    end

    it "inserts to right of root if value is equal to the root" do
      subject.insert(10)
      subject.insert(10)
      expect(subject.root.right.value).to eq(10)
    end

    it "inserts in the appropriate place given a large tree" do
      [10, 8, 12, 11, 6, 9, 14, 9, 13].each { |el| subject.insert(el) }
      #    expected structure:
      #         10
      #       /    \
      #      8      12
      #     / \    /  \
      #    6  9   11  14
      #        \      /
      #        9    13

      expect(subject.root.value).to eq(10)

      first_left = subject.root.left
      first_right = subject.root.right
      expect(first_left.value).to eq(8)
      expect(first_right.value).to eq(12)

      expect(first_left.left.value).to eq(6)
      expect(first_left.right.value).to eq(9)
      expect(first_left.right.right.value).to eq(9)
      expect(first_left.right.left).to eq(nil)

      expect(first_right.left.value).to eq(11)
      expect(first_right.right.value).to eq(14)
      expect(first_right.right.left.value).to eq(13)
      expect(first_right.right.right).to eq(nil)
    end

  end

end #of Node
