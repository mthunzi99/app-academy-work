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

  
end