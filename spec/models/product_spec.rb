require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    it "should be vaild if all fields have information" do
      product = Product.new(name: "Terrence", price: 5000, quantity: 6, category: Category.new)
      expect(product).to be_valid 
    end
    it "Should not be valid without a name" do
      product = Product.new(name: nil, price: 5000, quantity: 6, category: Category.new )
      expect(product).to_not be_valid
    end
    it "Should not be valid without a price" do
      product = Product.new(name: nil, price: nil, quantity: 6, category: Category.new )
      expect(product).to_not be_valid
    end
    it "Should not be valid without a quantity" do
      product = Product.new(name: nil, price: 5000, quantity: nil, category: Category.new )
      expect(product).to_not be_valid
    end
    it "Should not be valid without a categoy" do
      product = Product.new(name: nil, price: 5000, quantity: 6, category: nil )
      expect(product).to_not be_valid
    end

  end
  
end
