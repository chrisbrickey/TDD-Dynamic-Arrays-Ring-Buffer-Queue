require "./lib_hash/node"
require "rspec/expectations"

describe Node do

  before(:all) do
    subject = Node.new
  end

  describe "Node#getter/setter" do

    it "allows access and assignment to value, left child, and right child" do
      subject.value = 16
      subject.left = 17
      subject.right = 18
      
      expect(subject.value).to eq(16)
      expect(subject.left).to eq(17)
      expect(subject.right).to eq(18)
    end

  end

end #of Node
