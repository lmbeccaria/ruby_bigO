def max_in_array(array)
  max = array[0]
  i=0
  while i < array.length
    max = array[i] if max < array[i]
    i += 1
  end

  return "Max value in array is: #{max}"
end

def min_in_array(array)
  min=array[0]
  i=0
  while i < array.length
    min = array[i] if array[i] < min
    i += 1
  end
    return "Smallest value in array is: #{min}"
end

def repeats_in_array(array, search)
  count=0
  found_in =[]
  i=0
  while i < array.length
    if array[i] == search
      found_in << i
      count += 1
    end

    i += 1
  end
  return "count=#{count} found in=#{found_in}"
end

def array_length(array)
  length=0
  while array[length] != nil
    length += 1
  end
  return length
end
