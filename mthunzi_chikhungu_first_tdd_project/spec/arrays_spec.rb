require 'first_tdd.rb'
require 'rspec'

describe Array do
  subject(:array) { Array.new }

  describe "#uniq" do
    it "removes duplicates from an array." do
      array = [1, 2, 1, 3, 3]
      expect(array.uniq).to eq([1, 2, 3])
    end
  end
end