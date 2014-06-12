class TreeNode
  attr_accessor :value, :left, :right

  def initialize(val, left=nil, right=nil)
    @value = val
    @left = left
    @right = right
  end
end

class BinaryTree
  attr_reader :root

  def initialize(root=nil, *values)
    puts "Initializing binary tree..."
    @root = TreeNode.new(root)
    build_tree(*values) if !values.empty?
  end

  def build_tree(*values)
    values.each do |v|
      insert(v)
    end
  end

  def insert(value)
    return @root = TreeNode.new(value) if @root.nil?

    node = @root
    while node != nil
      if node.value > value && node.left == nil
        node.left = TreeNode.new(value)
        puts "#{value} <- to left"
        return value
      elsif node.value < value && node.right == nil
        node.right = TreeNode.new(value)
        puts "#{value} -> to right"
        return value
      elsif node.value > value
        node = node.left
        puts "#{value} <- to left"
      elsif node.value < value
        node = node.right
        puts "#{value} -> to right"
      elsif node.value == value
        return value
      end
    end
  end

  def ordered_keys
    @ordered_keys = []
    traverse
    @ordered_keys
  end

  def traverse
    inorder_traversal
  end

  def preorder_traversal(node = @root)
    return if node.nil?
    @ordered_keys << node.value
    puts node.value.to_s
    preorder_traversal(node.left)
    preorder_traversal(node.right)
  end

  def inorder_traversal(node = @root)
    return if node.nil?
    preorder_traversal(node.left)
    @ordered_keys << node.value
    puts node.value.to_s
    preorder_traversal(node.right)
  end

  def postorder_traversal(node = @root)
    return if node.nil?
    preorder_traversal(node.left)
    preorder_traversal(node.right)
    @ordered_keys << node.value
    puts node.value.to_s
  end

  def find(value)
    node = @root
    while node != nil
      if node.value > value
        node = node.left
      elsif node.value < value
        node = node.right
      elsif node.value == value
        puts "Value #{value} found in tree..."
        return true
      end
    end
    puts " Value NOT found in tree"
    return false
  end
end
