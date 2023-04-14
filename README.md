# Ruby Refactoring Kata 1

This is a refactoring exercise, so you will be starting with a legacy (but fully tested) code base. Your job is to add the required features described below, while keeping the code 100% covered by tests. Due to the high complexitiy of the starting code base, you will probably have to do some refactoring to be able to implement the new behavior.

## Setup

You should have [Ruby](https://www.ruby-lang.org/en/) 2.7 or newer and [bundler](https://bundler.io/) 2.1 or newer installed. After that, clone this repository and just run `bundle install` on the project root to install all dependencies.

To run the tests, use `bundle exec rspec`. To generate a test coverage report, set the `COVERAGE` environment variable to some value and run the tests, for example: `COVERAGE=1 bundle exec rspec`. The project starts with all tests passing and 100% test coverage.

We also include the gems [flog](https://ruby.sadi.st/Flog.html) and [RuboCop](https://rubocop.org/) if you want to check the code quality. Run a code complexity analysis with flog by running `bundle exec flog -g lib/`, or run a code style and format analysis with RuboCop by running `bundle exec rubocop lib/*.rb`.

## Description

Hi and welcome to team Gilded Rose. As you know, we are a small inn with a prime location in a prominent city run by a friendly innkeeper named Allison. We also buy and sell only the finest goods. Unfortunately, our goods are constantly degrading in quality as they approach their sell by date. We have a system in place that updates our inventory for us. It was developed by a no-nonsense type named Leeroy, who has moved on to new adventures. Your task is to add the new feature to our system so that we can begin selling a new category of products. First an introduction to our system:

### Requirements

- All products have a `days_remaining` value which denotes the number of days we have to sell the product
- All products have a `quality` value which denotes how valuable the product is
- At the end of each day our system lowers both values for every product

Pretty simple, right? Well this is where it gets interesting:

- Once the sell by date has passed, `quality` degrades twice as fast
- The `quality` of a product is never negative
- "Aged Brie" actually increases in `quality` the older it gets
- The `quality` of a product is never more than 50
- "Sulfuras", being a legendary product, has no sell by date nor decreases in `quality`
- "Backstage Passes", like "Aged Brie", increases in `quality` as its `days_remaining` value approaches; `quality` increases by 2 when there are 10 days or less and by 3 when there are 5 days or less but `quality` drops to 0 after the concert

We have recently signed a supplier of conjured products. This requires an update to our system:

- "Conjured" products degrade in `quality` twice as fast as normal products

Feel free to make any changes to the `#update` method and add any new code as long as everything still works correctly. However, do not alter the `Product` class public interface as it belongs to the goblin in the corner who will insta-rage and one-shot you as he doesn't believe in shared code ownership.

Just for clarification, a product can never have its `quality` increase above 50, however "Sulfuras" is a legendary product and as such its `quality` is 80 and it never alters.

### Instructions

- Given the above requirements, change `#update` in `lib/product.rb` to support "Conjured" products.
- Hint: Make use of `spec/product_spec.rb`.

## References

This is a modified version of the [Gilded Rose Kata](http://iamnotmyself.com/2011/02/14/refactor-this-the-gilded-rose-kata/), inspired by [Jim Weirich's version](https://github.com/jimweirich/gilded_rose_kata) of it in Ruby and also by [Sandi Metz's presentation](https://www.youtube.com/watch?v=8bZh5LMaSmE) at RailsConf which uses a modified premise.
