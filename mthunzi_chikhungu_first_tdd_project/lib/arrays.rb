class Array
  def uniq
    unique_elements = []

    self.each_with_index do |ele, i|
      unique_elements << ele if !unique_elements.include?(ele)
    end
    
    unique_elements
  end

  def two_sum
    two_sum_array = []

    i = 0
    while i < self.size
      j = i + 1
      while j < self.size
        two_sum_array << [i, j] if self[i] + self[j] == 0
        j += 1
      end
      i += 1
    end

    two_sum_array.sort
  end 
end

def my_transpose(matrix)
  transposed = Array.new(matrix.size) { Array.new(matrix.size) }

  matrix.each_with_index do |row, i|
    row.each_with_index do |ele, j|
      transposed[j][i] = ele
    end
  end
  
  transposed
end

def stock_picker(stock_prices)
  
end
