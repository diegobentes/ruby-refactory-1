# frozen_string_literal: true

module Products
  ##
  # The Sulfuras class represents a specific type of product, which is a subclass of Products::Item.
  # It contains the update method to handle the aging process of Sulfuras products.
  # Sulfuras products do not age or change in quality, so the update method is empty and be declared in super class.
  #
  class Sulfuras < Products::Item; end
end
