# frozen_string_literal: true

module Products
  ##
  # The AgedBrie class represents a specific type of product, which is a subclass of Products::Item.
  # It contains the update method to handle the aging process of Aged Brie products.
  #
  class AgedBrie < Products::Item
    # Updates the quality and days remaining for the Aged Brie product.
    #
    # The quality increases as it gets older.
    # If the days remaining is less than or equal to 0, the quality increases twice as fast.
    def update
      decreased_days_remaining
      return increase_quality(2) if @days_remaining <= 0

      increase_quality
    end
  end
end
