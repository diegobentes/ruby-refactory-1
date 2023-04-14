# frozen_string_literal: true

module Products
  ##
  # The Normal class represents a specific type of product, which is a subclass of Products::Item.
  # It contains the update method to handle the aging process of Normal products.
  #
  class Normal < Products::Item
    # Updates the quality and days remaining for the Normal product.
    #
    # The quality of the Normal product decreases as it gets older.
    # If the days remaining is less than or equal to 0, the quality decreases twice as fast.
    def update
      decreased_days_remaining
      return decrease_quality(2) if @days_remaining <= 0

      decrease_quality
    end
  end
end
