# frozen_string_literal: true

module Products
  ##
  # The Backstage class represents a specific type of product, which is a subclass of Products::Item.
  # It contains the update method to handle the aging process of Backstage products.
  #
  class Backstage < Products::Item
    # Updates the quality and days remaining for the Backstage product.
    #
    # The quality increases as it gets closer to the expiration date.
    # If the days remaining is less than 5, the quality increases by 3.
    # If the days remaining is less than 10, the quality increases by 2.
    # If the days remaining is negative, the quality drops to 0.
    def update
      decreased_days_remaining

      return zero_quality if @days_remaining.negative?
      return increase_quality(3) if @days_remaining < 5
      return increase_quality(2) if @days_remaining < 10

      increase_quality
    end
  end
end
