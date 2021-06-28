require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    it 'saves product to database if all the fields are valid' do
      @category = Category.create(name: 'New')
      @product = Product.new(name: 'New Product', price: 100, quantity: 1, category: @category)
      @product.save
      expect(@product).to be_valid
    end

    it 'fails to save if product name is missing' do
      @category = Category.create(name: 'New')
      @product = Product.new(name: nil, price: 100, quantity: 1, category: @category)
      @product.save
      expect(@product).not_to be_valid
      expect(@product.errors.full_messages).to include "Name can't be blank"
    end

    it 'fails to save if product price is missing' do
      @category = Category.create(name: 'New')
      @product = Product.new(name: 'New Product', price: nil, quantity: 1, category: @category)
      @product.save
      expect(@product).not_to be_valid
      expect(@product.errors.full_messages).to include "Price can't be blank"
    end

    it 'fails to save if product quantity is missing' do
      @category = Category.create(name: 'New')
      @product = Product.new(name: 'New Product', price: 100, quantity: nil, category: @category)
      @product.save
      expect(@product).not_to be_valid
      expect(@product.errors.full_messages).to include "Quantity can't be blank"
    end

    it 'fails to save if product category is missing' do
      @category = Category.create(name: 'New')
      @product = Product.new(name: 'New Product', price: 100, quantity: 1, category: nil)
      @product.save
      expect(@product).not_to be_valid
      expect(@product.errors.full_messages).to include "Category can't be blank"
    end
  end
end