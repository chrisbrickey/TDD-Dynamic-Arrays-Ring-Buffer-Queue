require "./lib_bst/node"
require "rspec/expectations"

describe Node do

  describe "Node#initialize" do

    it "initializes left, right, and parent instance variables to nil" do
      subject = Node.new(10)
      expect(subject.parent).to eq(nil)
      expect(subject.left).to eq(nil)
      expect(subject.right).to eq(nil)
    end

  end

  describe "Node#getter/setter" do

    it "allows getter access to value attribute" do
      subject = Node.new(10)
      expect(subject.value).to eq(10)
    end

    it "does not allow setter access (read only) to value attribute" do
      subject = Node.new(10)
      expect do
        subject.value = 9
      end.to raise_exception
    end

    it "allows getter and setter access to parent, left child, and right child attributes" do
      subject = Node.new(10)

      the_parent = Node.new(2)
      lefty = Node.new(8)
      righty = Node.new(12)

      subject.parent = the_parent
      subject.left = lefty
      subject.right = righty

      expect(subject.parent.value).to eq(2)
      expect(subject.left.value).to eq(8)
      expect(subject.right.value).to eq(12)
    end

  end

end #of Node
