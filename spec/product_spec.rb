if !ENV['COVERAGE'].nil?
  require 'simplecov'
  SimpleCov.start
end

require_relative '../lib/product'

describe Product do
  describe '#update' do

    context 'normal product' do
      it 'before sell date' do
        product = Product.new('normal', 10, 5)
        product.update

        expect(product.quality).to eq(9)
        expect(product.days_remaining).to eq(4)
      end
      it 'on sell date' do
        product = Product.new('normal', 10, 0)
        product.update

        expect(product.quality).to eq(8)
        expect(product.days_remaining).to eq(-1)
      end
      it 'after sell date' do
        product = Product.new('normal', 10, -1)
        product.update

        expect(product.quality).to eq(8)
        expect(product.days_remaining).to eq(-2)
      end
      it 'of zero quality' do
        product = Product.new('normal', 0, 5)
        product.update

        expect(product.quality).to eq(0)
        expect(product.days_remaining).to eq(4)
      end
    end

    context 'brie' do
      it 'before sell date' do
        product = Product.new('Aged Brie', 10, 5)
        product.update

        expect(product.quality).to eq(11)
        expect(product.days_remaining).to eq(4)
      end
      it 'before sell date with max quality' do
        product = Product.new('Aged Brie', 50, 5)
        product.update

        expect(product.quality).to eq(50)
        expect(product.days_remaining).to eq(4)
      end
      it 'on sell date' do
        product = Product.new('Aged Brie', 10, 0)
        product.update

        expect(product.quality).to eq(12)
        expect(product.days_remaining).to eq(-1)
      end
      it 'on sell date near max quality' do
        product = Product.new('Aged Brie', 49, 0)
        product.update

        expect(product.quality).to eq(50)
        expect(product.days_remaining).to eq(-1)
      end
      it 'on sell date with max quality' do
        product = Product.new('Aged Brie', 50, 0)
        product.update

        expect(product.quality).to eq(50)
        expect(product.days_remaining).to eq(-1)
      end
      it 'after sell date' do
        product = Product.new('Aged Brie', 10, -5)
        product.update

        expect(product.quality).to eq(12)
        expect(product.days_remaining).to eq(-6)
      end
      it 'after sell date with max quality' do
        product = Product.new('Aged Brie', 50, -5)
        product.update

        expect(product.quality).to eq(50)
        expect(product.days_remaining).to eq(-6)
      end
    end

    context 'sulfuras' do
      it 'before sell date' do
        product = Product.new('Sulfuras, Hand of Ragnaros', 80, 5)
        product.update

        expect(product.quality).to eq(80)
        expect(product.days_remaining).to eq(5)
      end
      it 'on sell date' do
        product = Product.new('Sulfuras, Hand of Ragnaros', 80, 0)
        product.update

        expect(product.quality).to eq(80)
        expect(product.days_remaining).to eq(0)
      end
      it 'after sell date' do
        product = Product.new('Sulfuras, Hand of Ragnaros', 80, -2)
        product.update

        expect(product.quality).to eq(80)
        expect(product.days_remaining).to eq(-2)
      end
    end

    context 'backstage pass' do
      it 'long before sell date' do
        product = Product.new('Backstage passes to a TAFKAL80ETC concert', 10, 11)
        product.update

        expect(product.quality).to eq(11)
        expect(product.days_remaining).to eq(10)
      end
      it 'medium close to sell date upper bound' do
        product = Product.new('Backstage passes to a TAFKAL80ETC concert', 10, 10)
        product.update

        expect(product.quality).to eq(12)
        expect(product.days_remaining).to eq(9)
      end
      it 'medium close to sell date upper bound at max quality' do
        product = Product.new('Backstage passes to a TAFKAL80ETC concert', 50, 10)
        product.update

        expect(product.quality).to eq(50)
        expect(product.days_remaining).to eq(9)
      end
      it 'medium close to sell date lower bound' do
        product = Product.new('Backstage passes to a TAFKAL80ETC concert', 10, 6)
        product.update

        expect(product.quality).to eq(12)
        expect(product.days_remaining).to eq(5)
      end
      it 'medium close to sell date lower bound at max quality' do
        product = Product.new('Backstage passes to a TAFKAL80ETC concert', 50, 6)
        product.update

        expect(product.quality).to eq(50)
        expect(product.days_remaining).to eq(5)
      end
      it 'very close to sell date upper bound' do
        product = Product.new('Backstage passes to a TAFKAL80ETC concert', 10, 5)
        product.update

        expect(product.quality).to eq(13)
        expect(product.days_remaining).to eq(4)
      end
      it 'very close to sell date upper bound at max quality' do
        product = Product.new('Backstage passes to a TAFKAL80ETC concert', 50, 5)
        product.update

        expect(product.quality).to eq(50)
        expect(product.days_remaining).to eq(4)
      end
      it 'very close to sell date lower bound' do
        product = Product.new('Backstage passes to a TAFKAL80ETC concert', 10, 1)
        product.update

        expect(product.quality).to eq(13)
        expect(product.days_remaining).to eq(0)
      end
      it 'very close to sell date lower bound at max quality' do
        product = Product.new('Backstage passes to a TAFKAL80ETC concert', 50, 1)
        product.update

        expect(product.quality).to eq(50)
        expect(product.days_remaining).to eq(0)
      end
      it 'on sell date' do
        product = Product.new('Backstage passes to a TAFKAL80ETC concert', 10, 0)
        product.update

        expect(product.quality).to eq(0)
        expect(product.days_remaining).to eq(-1)
      end
      it 'after sell date' do
        product = Product.new('Backstage passes to a TAFKAL80ETC concert', 10, -10)
        product.update

        expect(product.quality).to eq(0)
        expect(product.days_remaining).to eq(-11)
      end
    end

    context 'conjured product' do
      it 'before sell date' do
        product = Product.new('Conjured Product', 10, 5)
        product.update

        expect(product.quality).to eq(8)
        expect(product.days_remaining).to eq(4)
      end
      it 'on sell date' do
        product = Product.new('Conjured Product', 10, 0)
        product.update

        expect(product.quality).to eq(6)
        expect(product.days_remaining).to eq(-1)
      end
      it 'after sell date' do
        product = Product.new('Conjured Product', 10, -1)
        product.update

        expect(product.quality).to eq(6)
        expect(product.days_remaining).to eq(-2)
      end
      it 'of zero quality' do
        product = Product.new('Conjured Product', 0, 5)
        product.update

        expect(product.quality).to eq(0)
        expect(product.days_remaining).to eq(4)
      end
      it 'on sell date with zero quality' do
        product = Product.new('Conjured Product', 0, 0)
        product.update

        expect(product.quality).to eq(0)
        expect(product.days_remaining).to eq(-1)
      end
      it 'after sell date with zero quality' do
        product = Product.new('Conjured Product', 0, -1)
        product.update

        expect(product.quality).to eq(0)
        expect(product.days_remaining).to eq(-2)
      end
    end

  end
end
