require_relative 'node'
require_relative 'bst'
require "test/unit"
 
class TestBST < Test::Unit::TestCase

  def test_bst_insert_and_search
    root = Node.new(7)
    bst = BST.new(root)
    bst.insert(Node.new(3))
    bst.insert(Node.new(9))
    bst.insert(Node.new(2))
    bst.insert(Node.new(8))
    bst.insert(Node.new(11))
    bst.insert(Node.new(4))
    bst.insert(Node.new(16))

    assert_equal(bst.search(21), nil)
    assert_equal(bst.search(3).value, 3)
    assert_equal(bst.search(9).value, 9)
    assert_equal(bst.search(2).value, 2)
    assert_equal(bst.search(8).value, 8)
    assert_equal(bst.search(11).value, 11)
    assert_equal(bst.search(4).value, 4)
    assert_equal(bst.search(16).value, 16)
  end

  def test_bst_find_min
    root = Node.new(7)
    bst = BST.new(root)
    bst.insert(Node.new(3))
    bst.insert(Node.new(9))
    bst.insert(Node.new(2))
    bst.insert(Node.new(8))
    bst.insert(Node.new(11))
    bst.insert(Node.new(4))
    bst.insert(Node.new(16))

    assert_equal(bst.find_min(bst.search(9)).value, 8)
  end
end
