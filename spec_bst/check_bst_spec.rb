require "./lib_bst/bst"
require './lib_bst/node'
require './lib_bst/checkBST'
require "rspec/expectations"

describe "checkBST" do

  let(:subject) { BinarySearchTree.new }

  it "returns true if node is the root of bst" do
    [10, 8, 12, 11, 6, 9, 14, 9, 13, 51].each { |el| subject.insert(el) }
    #    expected structure:
    #         10
    #       /    \
    #      8      12
    #     / \    /  \
    #    6  9   11  14
    #        \      / \
    #        9    13   51

    expect(checkBST(subject.root)).to be true
  end

  it "returns false if node is nil" do
    expect(checkBST(subject.root)).to be false
  end

  it "returns false if node is not the root of bst (1 of 2)" do
    [10, 8, 12].each { |el| subject.insert(el) }
    subject.root.left.left = Node.new(10)
    #    expected structure:
    #         10
    #       /    \
    #      8      12
    #     /
    #    10

    expect(checkBST(subject.root)).to be false
  end

  it "returns false if node is not the root of bst (2 of 2)" do
    [10, 8, 12].each { |el| subject.insert(el) }
    subject.root.right.left = Node.new(8)
    #    expected structure:
    #         10
    #       /    \
    #      8      12
    #            /
    #           8

    expect(checkBST(subject.root)).to be false
  end

end #of checkBST

describe "#check_subtree" do

  let(:big_tree) { BinarySearchTree.new }
  let(:small_tree) { BinarySearchTree.new }

  it "returns false when root does not exist in larger tree" do
    [10, 8, 12, 11, 6, 9, 14].each { |el| big_tree.insert(el) }
    #    expected structure:
    #         10
    #       /    \
    #      8      12
    #     / \    /  \
    #    6  9   11  14

    small_tree.insert(13)
    #    expected structure:
    #         13

    expect(check_subtree(small_tree, big_tree)).to be false
  end

  xit "returns false when small tree does not exist in larger tree" do
  end

  xit "returns true when small tree exists in larger tree" do
  end

end #of check_subtree
