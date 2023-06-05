require 'arrays.rb'
require 'rspec'

describe Array do
  subject(:array) { Array.new }

  describe "#uniq" do
    it "removes duplicates from an array." do
      array = [1, 2, 1, 3, 3]
      expect(array.uniq).to eq([1, 2, 3])
    end
  end

  describe "#two_sum" do
    it "finds all pairs of positions where the elements at those positions sum to zero." do
      array = [-1, 0, 2, -2, 1]
      expect(array.two_sum).to eq([[0, 4], [2, 3]])
    end
  end

  describe "#my_tranpose" do
    it "turns all the rows of a given matrix into columns and vice-versa." do
      array = [
        [0, 1, 2],
        [3, 4, 5],
        [6, 7, 8]
      ]
      expect(my_transpose(array)).to eq([[0, 3, 6],
          [1, 4, 7],
          [2, 5, 8]
          ])
    end
  end

  describe "#stock_picker" do
    it "outputs the most profitable pair of days on which to first buy the stock and then sell the stock." do
      array = [35, 36, 40, 32, 50, 53, 67, 20, 26, 41]
      expect(stock_picker(array)).to eq([3,6])
    end
  end
end