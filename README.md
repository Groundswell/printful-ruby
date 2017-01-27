# Printful API Ruby Bindings

The Printful API gem provides a ruby bindings SDK for quick and easy access to
the Printful service.  Printful is a online company that will print custom
designs onto a variety of different apparel/accessories, then ship that item
with custom packaging directly to your customer.  Printful make custom:

* T-shirts
* Sweatshirts
* Wall art (prints, posters, canvas, ...)
* Mugs
* Pillows
* Totes
* Hats
* Leggings
* Phone Cases
* Socks
* Dresses
* Skirts
* and more

[Sign up here](signup) to explore the full list of products, start creating,
previewing, and selling your designs.

We provide a comprehensive list of classes which map to the Printful data model,
allowing developers to pull and manipulate data with ease. This gem wraps
[the official Printful client library](libraries).


## Installation

You don't need this source code unless you want to modify the gem. If you just
want to use the Printful API Ruby bindings, you should run:

    gem install printful_api

If you want to build the gem from source:

    gem build printful_api.gemspec

### Requirements

* Ruby 1.9.3 or above.
* A Printful account, and api key.  [Sign up here](signup)

### Bundler

If you are installing via bundler, you should be sure to use the https rubygems
source in your Gemfile, as any gems fetched over http could potentially be
compromised in transit and alter the code of gems fetched securely over https:

``` ruby
source 'https://rubygems.org'

gem 'rails'
gem 'printful_api'
```

## Usage

In order to access the Printful API you must first have an api key, which get
after creating [a Printful account](signup).  After signing in, go to your
[store dashboard](storedashboard).  If you haven't yet
create a store, otherwise click on the store to get to the "Update Store" screen.
Click on the "API" tab, to get to the "API Access" view.  In a box below, there
will be a random set of letters and numbers, this is your api key.  You will
need to assign the api to `PrintfulAPI.api_key` so the gem can give you access
to your store.

Or you can set the api key into the `PRINTFUL_API_KEY` environment variable.

``` ruby
require "printful_api"
PrintfulAPI.api_key = "g1n1h..."

# list all products
PrintfulAPI::Product.all

# get a single order by external ID (your order id)
PrintfulAPI::Order.get( '@YOUR_ORDER_ID' )


# get a single order by Printful's order ID
PrintfulAPI::Order.get( 342342 )
```

Once assigned, the gem will use it as necessary to authenticate requests for your
store.

## Products / Variations

``` ruby

# get a single product, in this case a T-SHIRT
product = PrintfulAPI::Product.get(5)

product.type # "T-SHIRT"
product.brand # "American Apparel"
product.model # "2001 Fine Jersey Short Sleeve Men T-Shirt"
product.image # "https://d1yg28hrivmbqm.cloudfront.net/products/5/product_1483514498.jpg"
product.variant_count # 270

# a list of different file types you can provide for printing, and the cost for using them
product.files # FileType[]

# list the various, some 260+ variations, cut, color, etc
product.variants # Variant[]

# list the different options, options for configuring the process
product.options # OptionType[]

# a list of dimensions for the product
product.dimensions # Hash

```


## Orders

``` ruby

# @todo

```

## Files

``` ruby

# @todo

```

## Shipping and Tax Rates

``` ruby

# @todo

```

## Country/State Lists

``` ruby

# @todo

```

[storedashboard]: https://www.printful.com/dashboard/store
[libraries]: https://www.printful.com/docs/libraries
[signup]: https://printful.com/a/amrap
