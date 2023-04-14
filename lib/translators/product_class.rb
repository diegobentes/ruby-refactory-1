# frozen_string_literal: true

module Translators
  ##
  # The ProductClass module provides a mapping between product names and their corresponding
  # classes in the Products module. It is meant to be used by translators to easily find
  # the appropriate class for a given product name.
  #
  module ProductClass
    # A constant hash that maps product names to their corresponding classes.
    #
    # - 'normal' maps to the ::Products::Normal class
    # - 'Aged Brie' maps to the ::Products::AgedBrie class
    # - 'Backstage passes to a TAFKAL80ETC concert' maps to the ::Products::Backstage class
    # - 'Sulfuras, Hand of Ragnaros' maps to the ::Products::Sulfuras class
    # - 'Conjured Product' maps to the ::Products::Conjured class
    #
    CLASSES = {
      'normal' => ::Products::Normal,
      'Aged Brie' => ::Products::AgedBrie,
      'Backstage passes to a TAFKAL80ETC concert' => ::Products::Backstage,
      'Sulfuras, Hand of Ragnaros' => ::Products::Sulfuras,
      'Conjured Product' => ::Products::Conjured
    }.freeze
  end
end
