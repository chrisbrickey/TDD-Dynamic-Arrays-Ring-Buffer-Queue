require "./lib_bst/bst_balanced"
require "rspec/expectations"

describe BalancedBST do

  before(:all) do
    subject = BalancedBST.new
  end

  describe "BalancedBST#insert" do


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


    it "constructs the appropriate left/right relationships for a large tree" do
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


    it "constructs the appropriate parent relationships for a large tree" do
      [10, 8, 12, 11, 6, 9, 14, 9, 13, 51].each { |el| subject.insert(el) }
      #    expected structure:
      #         10
      #       /    \
      #      8      12
      #     / \    /  \
      #    6  9   11  14
      #        \      / \
      #        9    13   51

      expect(subject.root.parent).to eq(nil)

      first_left = subject.root.left #8
      first_right = subject.root.right #12
      expect(first_left.parent.value).to eq(10)
      expect(first_right.parent.value).to eq(10)

      expect(first_left.left.parent.value).to eq(8)
      expect(first_left.right.parent.value).to eq(8)
      expect(first_left.right.right.parent.value).to eq(9)

      expect(first_right.left.parent.value).to eq(12)
      expect(first_right.right.parent.value).to eq(12)
      expect(first_right.right.left.parent.value).to eq(14)
      expect(first_right.right.right.parent.value).to eq(14)
    end

    xit "doesn't rebalance when insertion does not create imbalance" do
    end

    xit "does rebalance when insertion creates imbalance" do
    end

  end #insert


  describe "BalancedBST#find" do


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

      expect(subject.find(10).value).to eq(10)
      expect(subject.find(8).value).to eq(8)
      expect(subject.find(12).value).to eq(12)
      expect(subject.find(6).value).to eq(6)
      expect(subject.find(9).value).to eq(9)
      expect(subject.find(11).value).to eq(11)
      expect(subject.find(14).value).to eq(14)
      expect(subject.find(13).value).to eq(13)
      expect(subject.find(51).value).to eq(51)
    end

    xit "runs faster than BST#find, which does not rebalance " do
    end

  end #of find


  describe "BalancedBST#delete" do

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

      #    expected structure:
      #         10
      #       /    \
      #      8      12
      #       \    /  \
      #       9   11  14
      #        \      / \
      #        9    13   51

      expect(subject.root.value).to eq(10)

      first_left = subject.root.left
      first_right = subject.root.right
      expect(first_left.value).to eq(8)
      expect(first_right.value).to eq(12)

      expect(first_left.left).to eq(nil)
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
      subject.delete(51)


      #    expected structure:
      #         10
      #       /    \
      #      8      12
      #     / \    /  \
      #    6  9   11  14
      #        \      /
      #        9     13

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


    it "when the target has only one child, it restructures the tree correctly" do
      [10, 8, 12, 6, 7, 14, 13, 51].each { |el| subject.insert(el) }

      #    expected structure:
      #         10
      #       /    \
      #      8      12
      #     /        \
      #    6         14
      #     \        / \
      #     7       13  51

      subject.delete(12)

      #    expected structure:
      #         10
      #       /    \
      #      8      14
      #     /      / \
      #    6     13   51
      #     \
      #     7

      expect(subject.root.value).to eq(10)

      first_left = subject.root.left #8
      first_right = subject.root.right #14
      expect(first_left.value).to eq(8)
      expect(first_right.value).to eq(14)
      expect(first_right.parent.value).to eq(10)

      expect(first_left.left.value).to eq(6)
      expect(first_left.left.right.value).to eq(7)
      expect(first_left.right).to eq(nil)

      expect(first_right.left.value).to eq(13)
      expect(first_right.right.value).to eq(51)
      expect(first_right.right.left).to eq(nil)
      expect(first_right.right.right).to eq(nil)


      subject.delete(8)

      #    expected structure:
      #         10
      #       /    \
      #     6       14
      #      \      / \
      #       7   13   51

      first_left = subject.root.left #6
      first_right = subject.root.right #14
      expect(first_left.value).to eq(6)
      expect(first_left.parent.value).to eq(10)
      expect(first_right.value).to eq(14)

      expect(first_left.left).to eq(nil)
      expect(first_left.right.value).to eq(7)
      expect(first_left.right.right).to eq(nil)

      expect(first_right.left.value).to eq(13)
      expect(first_right.right.value).to eq(51)
      expect(first_right.right.left).to eq(nil)
      expect(first_right.right.right).to eq(nil)
    end


    it "when the target has only one child and target is root, it restructures the tree correctly" do
      [10, 12, 14, 13, 51].each { |el| subject.insert(el) }

      #    expected structure:
      #         10
      #           \
      #            12
      #             \
      #             14
      #            / \
      #          13  51

      subject.delete(10)

      #    expected structure:
      #            12
      #             \
      #             14
      #            / \
      #          13  51

      expect(subject.root.value).to eq(12)
      expect(subject.root.parent).to eq(nil)

      expect(subject.root.left).to eq(nil)
      expect(subject.root.right.value).to eq(14)

      expect(subject.root.right.left.value).to eq(13)
      expect(subject.root.right.right.value).to eq(51)
    end

    it "when target has 2 children and left child is max of left subtree, it restructures the tree correctly" do
      [10, 8, 14, 6, 9, 12, 16, 4, 5].each { |el| subject.insert(el) }

      #    expected structure:
      #          10
      #       /       \
      #      8         14
      #     / \      /     \
      #    6  9     12      16
      #   /
      #  4
      #   \
      #    5

      subject.delete(8)

      #    expected structure:
      #          10
      #       /       \
      #      6         14
      #     / \      /     \
      #    4  9     12      16
      #     \
      #      5

      expect(subject.root.value).to eq(10)
      expect(subject.root.left.value).to eq(6)
      expect(subject.root.left.parent.value).to eq(10)

      expect(subject.root.left.left.value).to eq(4)
      expect(subject.root.left.right.value).to eq(9)
      expect(subject.root.left.right.parent.value).to eq(6)

      expect(subject.root.left.right.right).to eq(nil)
      expect(subject.root.left.left.left).to eq(nil)
      expect(subject.root.left.left.right.value).to eq(5)
    end


    it "when the target has two children, it restructures the tree correctly" do
      [10, 8, 14, 6, 9, 12, 16, 7, 6.5, 4, 15, 13, 11, 12.5].each { |el| subject.insert(el) }

      #    expected structure:
      #          10
      #       /       \
      #      8         14
      #     / \      /     \
      #    6  9     12      16
      #   / \      / \      /
      #  4   7    11  13  15
      #     /         /
      #    6.5      12.5

      subject.delete(8)

      #    expected structure:
      #          10
      #       /       \
      #      7          14
      #    /  \       /   \
      #   6   9      12      16
      #  / \        / \     /
      # 4   6.5    11  13  15
      #                /
      #              12.5

      expect(subject.root.value).to eq(10)
      expect(subject.root.left.value).to eq(7)
      expect(subject.root.left.parent.value).to eq(10)

      expect(subject.root.left.left.value).to eq(6)  #where we are failing
      expect(subject.root.left.left.parent.value).to eq(7)
      expect(subject.root.left.right.value).to eq(9)
      expect(subject.root.left.right.parent.value).to eq(7)

      expect(subject.root.left.right.right).to eq(nil)
      expect(subject.root.left.left.left.value).to eq(4)
      expect(subject.root.left.left.right.value).to eq(6.5)
      expect(subject.root.left.left.right.left).to eq(nil)
      expect(subject.root.left.left.right.right).to eq(nil)


      subject.delete(14)

      #    expected structure:
      #           10
      #       /        \
      #      7           13
      #     / \       /      \
      #    6  9      12        16
      #   / \       /  \      /
      #  4  6.5    11  12.5  15

      expect(subject.root.right.value).to eq(13)
      expect(subject.root.right.parent.value).to eq(10)

      expect(subject.root.right.left.value).to eq(12)
      expect(subject.root.right.left.parent.value).to eq(13)
      expect(subject.root.right.right.value).to eq(16)
      expect(subject.root.right.right.parent.value).to eq(13)

      expect(subject.root.right.left.left.value).to eq(11)
      expect(subject.root.right.left.right.value).to eq(12.5)
      expect(subject.root.right.left.right.left).to eq(nil)

      expect(subject.root.right.right.right).to eq(nil)
      expect(subject.root.right.right.left.value).to eq(15)

    end

    it "when the target is the root and it has two children, it restructures the tree correctly" do
      [10, 6, 12, 4, 8, 7, 11, 14].each { |el| subject.insert(el) }

      #    expected structure:
      #         10
      #       /    \
      #      6      12
      #     / \    /  \
      #    4   8  11  14
      #       /
      #      7

      subject.delete(10)

      #    expected structure:
      #          8
      #       /     \
      #      6       12
      #     / \     /  \
      #    4   7    11  14

      expect(subject.root.value).to eq(8)
      expect(subject.root.parent).to eq(nil)

      first_left = subject.root.left
      first_right = subject.root.right
      expect(first_left.value).to eq(6)
      expect(first_left.parent.value).to eq(8)
      expect(first_right.value).to eq(12)
      expect(first_right.parent.value).to eq(8)

      expect(first_left.left.value).to eq(4)
      expect(first_left.right.value).to eq(7)
      expect(first_left.right.right).to eq(nil)
      expect(first_left.right.left).to eq(nil)

      expect(first_right.left.value).to eq(11)
      expect(first_right.right.value).to eq(14)

    end

    xit "doesn't rebalance when deletion does not create imbalance" do
    end

    xit "does rebalance when deletion creates imbalance" do
    end

  end #delete

  describe "BalancedBST#depth" do

    it "returns 0 if tree is empty" do
      expect(subject.depth(subject.root)).to eq(0)
    end

    it "returns 1 if tree has one node" do
      subject.insert(10)
      expect(subject.depth(subject.root)).to eq(1)
    end

    it "returns 2 if tree has two nodes" do
      [10, 6].each { |el| subject.insert(el) }
      expect(subject.depth(subject.root)).to eq(2)
    end

    it "returns 2 if tree has three nodes on two levels" do
      [10, 6, 12].each { |el| subject.insert(el) }
      expect(subject.depth(subject.root)).to eq(2)
    end

    it "returns 3 if tree has three nodes on three levels leaning left" do
      [10, 6, 8].each { |el| subject.insert(el) }
      expect(subject.depth(subject.root)).to eq(3)
    end

    it "returns 3 if tree has three nodes on three levels leaning right" do
      [10, 6, 12, 11].each { |el| subject.insert(el) }
      expect(subject.depth(subject.root)).to eq(3)
    end

  end # depth



  describe "BalancedBST#is_balanced?" do

    it "returns true if no nodes" do
      expect(subject.is_balanced?).to be(true)
    end

    it "returns true if no children" do
      subject.insert(10)
      expect(subject.is_balanced?).to be(true)
    end

    it "returns true if root has one child" do
      [10, 6].each { |el| subject.insert(el) }
      expect(subject.is_balanced?).to be(true)
    end

    it "returns true if root has two children" do
      [10, 6, 12].each { |el| subject.insert(el) }
      expect(subject.is_balanced?).to be(true)
    end

    it "returns true if sub-trees have same depth" do
      [10, 6, 12, 4, 8, 7, 11, 14, 11.5].each { |el| subject.insert(el) }

      #    expected structure:
      #         10
      #       /    \
      #      6      12
      #     / \    /  \
      #    4   8  11  14
      #       /    \
      #      7      11.5

      expect(subject.is_balanced?).to be(true)
    end

    it "returns true if sub-trees have depth +1" do
      [10, 6, 12, 4, 8, 7, 11].each { |el| subject.insert(el) }

      #    expected structure:
      #         10
      #       /    \
      #      6      12
      #     / \    /
      #    4   8  11
      #       /
      #      7

      expect(subject.is_balanced?).to be(true)
    end

    it "returns true if sub-trees have depth -1" do
      [10, 6, 12, 8, 11, 14, 11.5].each { |el| subject.insert(el) }

      #    expected structure:
      #         10
      #       /    \
      #      6      12
      #       \    /  \
      #        8  11  14
      #            \
      #             11.5

      expect(subject.is_balanced?).to be(true)
    end

    it "returns false if sub-trees have depth 2" do
      [10, 6, 12, 4, 8, 7].each { |el| subject.insert(el) }

      #    expected structure:
      #         10
      #       /    \
      #      6      12
      #     /  \
      #    4    8
      #        /
      #       7

      expect(subject.is_balanced?).to be(false)
    end

    it "returns false if sub-trees have depth -2" do
      [10, 6, 12, 11, 14, 11.5].each { |el| subject.insert(el) }

      #    expected structure:
      #         10
      #       /    \
      #      6      12
      #            /  \
      #          11   14
      #            \
      #             11.5

      expect(subject.is_balanced?).to be(false)
    end

  end #is_balanced?

  describe "BalancedBST#traverse_in_order" do
    it "returns sorted array of all nodes" do
      unsorted = [10, 8, 12, 11, 6, 9, 14, 9, 13, 51]
      sorted = unsorted.sort
      unsorted.each { |el| subject.insert(el) }
      #    expected structure
      #         10
      #       /    \
      #      8      12
      #     / \    /  \
      #    6  9   11  14
      #        \      / \
      #        9    13   51
      expect(subject.traverse_in_order).to eq(sorted)
    end
  end #traverse_in_order

  describe "BalancedBST#rebalance" do
    it "doesn't change a balanced tree" do
      [10, 8, 12, 11, 6, 9, 14, 9, 13, 51].each { |el| subject.insert(el) }
      subject.rebalance
      #    expected structure (unchanged because already balanced):
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
      expect(first_left.right.right.value).to eq(9)
      expect(first_right.left.value).to eq(11)
      expect(first_right.right.left.value).to eq(13)

      expect(first_right.right.right.left).to eq(nil)
      expect(first_right.right.right.right).to eq(nil)
    end

    it "balances an unbalanced tree" do
      [10, 8, 14, 6, 9, 12, 16, 4, 5].each { |el| subject.insert(el) }

      #    expected structure:
      #          10
      #       /       \
      #      8         14
      #     / \      /     \
      #    6  9     12      16
      #   /
      #  4
      #   \
      #    5

      expect(subject.is_balanced?).to be false
      subject.rebalance
      expect(subject.is_balanced?).to be true
    end


  end #of rebalance

end #of BalancedBST
