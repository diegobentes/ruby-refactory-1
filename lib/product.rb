# frozen_string_literal: true

require 'products/item'
require 'products/aged_brie'
require 'products/backstage'
require 'products/conjured'
require 'products/normal'
require 'products/sulfuras'
require 'translators/product_class'

##
# The Product class represents a product with a name, quality, and days_remaining.
# It provides an update method to update the product's quality and days_remaining based on various rules.
#
class Product
  attr_reader :name, :quality, :days_remaining

  # Initializes a new Product object with the given name, quality, and days remaining.
  #
  # @param name [String] the name of the product.
  # @param quality [Integer] the initial quality of the product.
  # @param days_remaining [Integer] the initial number of days remaining before the product expires.
  def initialize(name, quality, days_remaining)
    @product_item = product_klass_builder(name, quality, days_remaining)
  end

  # Updates the quality and days remaining for the product using the specific product type rules.
  def update
    @product_item.update
    update_attributes
  end

  private

  # Builds an instance of the specific product type class based on the product name.
  #
  # @param name [String] the name of the product.
  # @param quality [Integer] the initial quality of the product.
  # @param days_remaining [Integer] the initial number of days remaining before the product expires.
  # @return [Products::Item] an instance of the specific product type class.
  def product_klass_builder(name, quality, days_remaining)
    ::Translators::ProductClass::CLASSES[name].new(quality, days_remaining)
  end

  # Updates the quality and days_remaining attributes of the Product instance from the specific product type class.
  def update_attributes
    @quality = @product_item.quality
    @days_remaining = @product_item.days_remaining
  end
end
