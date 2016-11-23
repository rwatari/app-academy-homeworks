require 'rspec'
require 'dessert'

=begin
Instructions: implement all of the pending specs (the `it` statements without blocks)! Be sure to look over the solutions when you're done.
=end

describe Dessert do
  let(:chef) { double("chef", name: "Gordon") }
  subject(:cake) { Dessert.new("cake", 30, chef) }

  describe "#initialize" do
    it "sets a type" do
      expect(cake.type).to eq("cake")
    end

    it "sets a quantity" do
      expect(cake.quantity).to eq(30)
    end

    it "starts ingredients as an empty array" do
      expect(cake.ingredients).to be_empty
    end

    it "raises an argument error when given a non-integer quantity" do
      expect { Dessert.new("cake", 'hi', chef) }.to raise_error(ArgumentError)
    end
  end

  describe "#add_ingredient" do
    it "adds an ingredient to the ingredients array" do
      cake.add_ingredient("egg")
      expect(cake.ingredients).to include("egg")
    end
  end

  describe "#mix!" do
    it "shuffles the ingredient array" do
      cake.add_ingredient("egg")
      cake.add_ingredient("flour")
      cake.add_ingredient("sugar")
      cake.add_ingredient("butter")
      cake.mix!
      expect(cake.ingredients).not_to eq(%w(egg flour sugar butter))
    end
  end

  describe "#eat" do
    it "subtracts an amount from the quantity" do
      cake.eat(10)
      expect(cake.quantity).to eq(20)
    end

    it "raises an error if the amount is greater than the quantity" do
      expect { cake.eat(100) }.to raise_error("not enough left!")
    end
  end

  describe "#serve" do
    it "contains the titleized version of the chef's name" do
      allow(chef).to receive(:titleize).and_return("Chef Gordon the Great Baker")
      expect(cake.serve).to include("Chef Gordon the Great Baker")
    end
  end

  describe "#make_more" do
    it "calls bake on the dessert's chef with the dessert passed in" do
      expect(chef).to receive(:bake).with(cake)
      cake.make_more
    end
  end
end
