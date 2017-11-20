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
      [10, 8, 12, 11, 6, 9, 14, 9, 13, 51].each { |el| subject.insert(el) }
      #    expected structure:
      #         10
      #       /    \
      #      8      12
      #     / \    /  \
      #    6  9   11  14
      #        \      / \
      #        9    13   51

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
      expect(first_right.right.right.value).to eq(51)

      expect(first_right.right.right.left).to eq(nil)
      expect(first_right.right.right.right).to eq(nil)
    end

  end

  describe "BinarySearchTree#find" do

    it "returns nil when value not present in tree" do
      [10, 8, 12, 11, 6, 9, 14, 9, 13].each { |el| subject.insert(el) }
      expect(subject.find(7)).to eq(nil)
      expect(subject.find(0)).to eq(nil)
      expect(subject.find(100)).to eq(nil)
    end

    it "returns the target node when value is present in tree" do
      [10, 8, 12, 11, 6, 9, 14, 9, 13, 51].each { |el| subject.insert(el) }

      #    expected structure:
      #         10
      #       /    \
      #      8      12
      #     / \    /  \
      #    6  9   11  14
      #        \      / \
      #        9    13   51

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
      expect(first_right.right.right.value).to eq(51)

      expect(first_right.right.right.left).to eq(nil)
      expect(first_right.right.right.right).to eq(nil)
    end

  end

  describe "BinarySearchTree#delete" do

    it "when value is not present in tree, it returns nil" do
      [10, 8, 12, 11, 6, 9, 14, 9, 13].each { |el| subject.insert(el) }
      expect(subject.delete(7)).to eq(nil)
      expect(subject.delete(0)).to eq(nil)
      expect(subject.delete(100)).to eq(nil)
    end

    it "when value is not present in tree, it does not alter the structure of the tree" do
      [10, 8, 12, 11, 6, 9, 14, 9, 13, 51].each { |el| subject.insert(el) }
      subject.delete(7)
      subject.delete(0)
      subject.delete(100)

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
      expect(first_right.right.right.value).to eq(51)

      expect(first_right.right.right.left).to eq(nil)
      expect(first_right.right.right.right).to eq(nil)
    end

    it "when value is present in tree, it returns the target node" do
      [10, 8, 12, 11, 6, 9, 14, 9, 13].each { |el| subject.insert(el) }
      expect(subject.delete(10).value).to eq(10)
      expect(subject.delete(8).value).to eq(8)
      expect(subject.delete(11).value).to eq(11)
      expect(subject.delete(9).value).to eq(9)
    end

    it "when the target is a left leaf, it restructures the tree correctly" do
      [10, 8, 12, 11, 6, 9, 14, 9, 13, 51].each { |el| subject.insert(el) }
      subject.delete(6)
      subject.delete(13)


      #    expected structure:
      #         10
      #       /    \
      #      8      12
      #     / \    /  \
      #    6  9   11  14
      #        \      / \
      #        9    13   15

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
      expect(first_right.right.right.value).to eq(51)

      expect(first_right.right.right.left).to eq(nil)
      expect(first_right.right.right.right).to eq(nil)
    end

    it "when the target is a right leaf, it restructures the tree correctly" do
      [10, 8, 12, 11, 6, 9, 14, 9, 13, 51].each { |el| subject.insert(el) }
      subject.delete(13)


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
      expect(first_right.right.right.value).to eq(51)

      expect(first_right.right.right.left).to eq(nil)
      expect(first_right.right.right.right).to eq(nil)

    end

  end

end #of BinarySearchTree
