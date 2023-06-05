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
  best_pair = nil
  best_profit = 0

  stock_prices.each_index do |buy_date|
    stock_prices.each_index do |sell_date|
      next if sell_date < buy_date

      profit = stock_prices[sell_date] - stock_prices[buy_date]
      if profit > best_profit
        best_pair, best_profit = [buy_date, sell_date], profit
      end
    end
  end

  best_pair  
end
