class Array
  def uniq
    unique_elements = []

    self.each.with_index do |ele, i|
      unique_elements << ele if !unique_elements.include?(ele)
    end
    
    unique_elements
  end

  def two_sum

  end 
end

def my_transpose(matrix)
  
end

def stock_picker(stock_prices)
  
end
