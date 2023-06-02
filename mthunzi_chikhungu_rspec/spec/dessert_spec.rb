require 'rspec'
require 'dessert'

=begin
Instructions: implement all of the pending specs (the `it` statements without blocks)! Be sure to look over the solutions when you're done.
=end

describe Dessert do
  let(:chef) { double("chef", :name => "Mthunzi") }
  subject(:donut) { Dessert.new("Donut", 3, chef) }

  describe "#initialize" do
    it "sets a type" do
      expect(donut.type).to eq("Donut")
    end

    it "sets a quantity" do
      expect(donut.quantity).to eq(3)
    end

    it "starts ingredients as an empty array" do
      expect(donut.ingredients).to be_empty
    end

    it "raises an argument error when given a non-integer quantity" do
      expect { Dessert.new("Donut", 3.4, chef) }.to raise_error(ArgumentError)
      expect { Dessert.new("Donut", "4", chef) }.to raise_error(ArgumentError)
    end
  end

  describe "#add_ingredient" do
    it "adds an ingredient to the ingredients array" do
      expect(donut.ingredients).to_not include('flour')
      donut.add_ingredient('flour')
      expect(donut.ingredients).to include('flour')
    end
  end

  describe "#mix!" do
    it "shuffles the ingredient array" do
      ingredients = ["milk", "flour", "sugar", "eggs"]
      ingredients.each { |ingredient| donut.add_ingredient(ingredient) }
  
      expect(donut.ingredients).to eq(ingredients)
      donut.mix!
      expect(donut.ingredients).to_not eq(ingredients)
      expect(donut.ingredients.sort).to eq(ingredients.sort)
    end
  end

  describe "#eat" do
    it "subtracts an amount from the quantity" do
      expect(donut.quantity).to eq(3)
      donut.eat(2)
      expect(donut.quantity).to eq(1)
    end

    it "raises an error if the amount is greater than the quantity" do
      expect { donut.eat(4) }.to raise_error("not enough left!")
      expect { donut.eat(100) }.to raise_error("not enough left!")
    end
  end

  describe "#serve" do
    it "contains the titleized version of the chef's name" do
      allow(chef).to receive(:titleize).and_return("Chef Mthunzi the Great Baker")
      expect(donut.serve).to eq("Chef Mthunzi the Great Baker has made 3 Donuts!")
    end
  end

  describe "#make_more" do
    it "calls bake on the dessert's chef with the dessert passed in" do
      allow(chef).to receive(:bake).with(donut)
      donut.make_more
    end
  end
end
