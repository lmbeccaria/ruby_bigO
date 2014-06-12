include Enumerable

class Node
  attr_accessor :value, :next

  def initialize(value, next_node=nil)
    @value = value
    @next = next_node
    puts "Initialize a Node with values: #{@value}"
  end

  def clear
    @next =nil
  end

  def delete
    @value = nil
    clear
  end

end

class List
  attr_accessor :head, :tail, :name, :length

  def initialize
    @head = nil
    @tail = nil
    @length = 0
  end

  def add(node)
    add_to_back(node)
  end

# Add a node to the front of the list
  def add_to_front(node)
    if @head.nil?
      @head = node
      @tail = node
    else
      node.next = @head
      @head = node
    end

    increment_list_length
    self.display
  end

# Add a node to the back of the list
  def add_to_back(node)
    if @head.nil?
      @head = node
      @tail = node
    else
      @tail.next = node
      @tail = node
    end

    increment_list_length
    self.display
  end

# Add node in the Nth position in the list
  def add_nth_position(mynode, position)
    if @head.nil?
      @head = mynode
      @tail = mynode
      increment_list_length
      puts "Empty list. Node is the first to be added to this list"
    elsif position >= length
      puts "That position is NOT available. Chose a position between 0 and #{self.length - 1}"
    else
      node_after = get_node_by_index(position)
      node_before = get_node_by_index(position - 1)
      node_before.next = mynode
      mynode.next = node_after
      increment_list_length
    end

    self.display
  end

# Remove a node from the front of the list
  def remove_from_front
    return "Empty list..." if @head.nil?
    node = @head
    @head = @head.next
    node.next = nil

    reduce_list_length
    self.display
  end

# Remove a Node from the back of the list
  def remove_from_back
    return "Empty list..." if @head.nil?

    node = @head
    while node != @tail
      if node.next.next.nil?
        node.next = nil
        @tail = node
        break
      else
        node = node.next
      end
    end

    if @head == @tail
      @head = nil
      @tail = nil
    end

    reduce_list_length
    self.display
  end

# Remove Node from the Nth position
  def remove_from_nth_position(position)
    if @head.nil?
      puts "Empty list. No nodes can be removed"
    elsif position >= length
      puts "That position is NOT available in this list. Chose a position between 0 and #{self.length - 1}"
    else
      node = get_node_by_index(position)
      node_before = get_node_by_index(position - 1)
      node_after = node.next
      node_before.next = node_after
      node.clear
      reduce_list_length
    end
    self.display
  end

# Count the number of times a node value occurrs in a list
  def count_repeats(mysearch)
    current = @head
    count=0
    while !current.nil?
      count += 1 if current.value == mysearch
      current = current.next
    end
    return count
  end

# Gets the Nth node value given the Nth index
  def get_node_by_index(myindex)
    return "Empty list. Add nodes" if @head.nil?
    return "The index: #{myindex} provided is larger than the length of the list" if myindex > self.length - 1
    return @head.value if @head == @tail

    current = @head
    index=0
    while !current.nil?
      return current if index == myindex

      current = current.next
      index += 1
    end
  end

# Gets the value of the nth node from the back of the list
  def get_node_from_back_by_index(myindex)
    return "Empty list. Add nodes" if @head.nil?
    return "The index: #{myindex} provided is larger than the length of the list" if myindex > self.length
    return @head.value if @head == @tail

    current = @head
    index = 1
    condition = self.length - myindex + 1
      #puts "self.length - myindex + 1 = #{condition}"
    while index <= condition
      #puts "index = #{index} current.value: #{current.value}"
      return "value: #{current.value} inidex front: #{index} index back: #{myindex}" if index == condition

      current = current.next
      index += 1
    end
  end

# Finds node by value. Returns position within the list
  def find_nodes_by_value(myvalue)
    return "Empty list. Add nodes" if @head.nil?
    return "Node: value: #{@head.value} index: #{0}" if @head == @tail

    found_in =[]
    current = @head
    index = 0

    while !current.nil?  # while (current.next != nil)
      if current.value == myvalue
        found_in << index
        puts "Node: value: #{current.value} index: #{index}"
      end
      current = current.next
      index +=1
    end

    return found_in
  end

# Display the node values in the list
  def display
    return "Empty list. Add nodes" if @head.nil?

    current = @head
    list = []

    while !current.nil?
      list << current.value
      current = current.next
    end
    puts list.join('->')
  end

  def increment_list_length
    @length += 1
  end

  def reduce_list_length
    @length -= 1
  end

  def each
    return nil if @head.nil?
    node = @head
    until node.nil?
      yield node
      node = node.next
    end
  end
end
