require 'pry'

# Returns a new hash with the fields that are the different between
# the old and new hashes. It recursively verify nested hashes.

def diffs_in_hash(old, new)
  diff = {}
  old.each do |key,old_value|
    if old_value.is_a?Hash
      recurse = diffs_in_hash(old_value, new[key])
      diff[key] = recurse if recurse != nil
    elsif new[key] != old_value
      diff[key] = [old_value, new[key]]
    end
  end

  return diff
end


