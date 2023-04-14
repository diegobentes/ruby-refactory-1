# frozen_string_literal: true

module Products
  ##
  # The Item class represents a generic product in the Products module.
  # It serves as a superclass for all specific product types.
  # The Item class contains methods to manage the quality and days remaining of products.
  #
  class Item
    attr_reader :quality, :days_remaining

    # This is a placeholder method for updating the quality and days remaining.
    # Specific product subclasses should override this method with their own update behavior.
    def update; end

    protected

    # Initializes a new Item object with the given quality and days remaining.
    #
    # @param quality [Integer] the initial quality of the product.
    # @param days_remaining [Integer] the initial number of days remaining before the product expires.
    def initialize(quality, days_remaining)
      @quality = quality
      @days_remaining = days_remaining
    end

    # Increases the quality of the product by the given quantity, with a maximum value of 50.
    #
    # @param qtd [Integer] the quantity to increase the quality (default: 1).
    def increase_quality(qtd = 1)
      @quality = [50, @quality + qtd].min
    end

    # Decreases the quality of the product by the given quantity, with a minimum value of 0.
    #
    # @param qtd [Integer] the quantity to decrease the quality (default: 1).
    def decrease_quality(qtd = 1)
      @quality = [0, @quality - qtd].max
    end

    # Sets the quality of the product to 0.
    def zero_quality
      @quality = 0
    end

    # Decreases the days remaining for the product by 1.
    def decreased_days_remaining
      @days_remaining -= 1
    end
  end
end
