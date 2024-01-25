# Big O-ctopus
fishes = ['fish', 'fiiish', 'fiiiiish', 'fiiiish', 'fffish', 'ffiiiiisshh', 'fsh', 'fiiiissshhhhhh']

# Sluggish Octopus
def slug(arr)
  longest_word = ""
  arr.each_with_index do |fish1, i1|
    arr.each_with_index do |fish2, i2|
      next if i1 == i2

      longer = fish2.length > fish1.length
      longest_word = longer ? fish2 : fish1
    end
  end

  longest_word
end

puts slug(fishes)

# Dominant Octopus
class Array
  def merge_sort
    return self if count <= 1

    middle = count / 2

    left, right = self.take(middle), self.drop(middle)
    sorted_left, sorted_right = left.merge_sort, right.merge_sort

    merge(sorted_left, sorted_right)
  end

  def merge(left, right)
    merged_array = []
    until left.empty? || right.empty?
      item = left.first.size < right.first.size ? left.shift : right.shift
      merged_array << item
    end

    merged_array + left + right
  end

  def dominant
    self.merge_sort.last
  end

end

puts fishes.dominant

# Clever Octopus
def clever(arr)
  longest = ""
  arr.each_with_index do |ele, i|
    break if i + 1 == arr.length

    longest = ele.size > arr[i+1].size ? ele : arr[i+1]
  end

  longest
end

puts clever(fishes)

# Dancing Octopus
tiles_array = ["up", "right-up", "right", "right-down", "down", "left-down", "left",  "left-up" ]

#slow Dance
def slow_dance(command, arr)
  arr.each_with_index do |direction, i|
    return i if command == direction
  end
end

puts slow_dance("up", tiles_array)
puts slow_dance("right-down", tiles_array)

# Constant Dance
tiles_hash = {
  "up" => 0, "right-up" => 1, "right" => 2, "right-down" => 3,
  "down" => 4, "left-down" => 5, "left" => 6,  "left-up" => 7
}

def constant_dance(direction, hash)
  hash[direction]
end

puts constant_dance("up", tiles_hash)
puts constant_dance("right-down", tiles_hash)