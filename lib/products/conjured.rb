# frozen_string_literal: true

module Products
  ##
  # The Conjured class represents a specific type of product, which is a subclass of Products::Item.
  # It contains the update method to handle the aging process of Conjured products.
  #
  class Conjured < Products::Item
    # Updates the quality and days remaining for the Conjured product.
    #
    # The quality of the Conjured product decreases twice as fast as regular products.
    # If the days remaining is less than or equal to 0, the quality also decreases two times as fast.
    def update
      decreased_days_remaining
      return decrease_quality(4) if @days_remaining <= 0

      decrease_quality(2)
    end
  end
end
