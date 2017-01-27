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

order = PrintfulAPI::Order.create( {
    "recipient": {
        "name": "John Doe",
        "address1": "19749 Dearborn St",
        "city": "Chatsworth",
        "state_code": "CA",
        "country_code": "US",
        "zip": "91311"
    },
	"external_id": 'order_1112',
    "items": [{
        "variant_id": 1,
        "quantity": 1,
        "files": [{
            "url": "http://example.com/files/posters/poster_1.jpg"
        }]
    }]
} )

order.id # 2071687
order.external_id # "order_1112"
order.status # "draft"
order.shipping # "FEDEX_SMART_POST"
order.created # 1485550869
order.updated # 1485550869
order.recipient # PrintfulAPI::Address
order.items # PrintfulAPI::Item[]
order.costs # PrintfulAPI::Cost
order.retail_costs # PrintfulAPI::Cost
order.shipments # []
order.gift # nil
order.packing_slip # nil

# once all order information is confirmed and correct, run the confirm command
# and the store owner will be charged, and the printing begins.
order.confirm_for_fulfillment()

# didn't mean to process the order?  delete it and the order will be canceled,
# and money returned to the store owner.
order.delete()

```

## Shipping and Tax Rates

``` ruby

# shipping options available for a set of items
shipping_rates = PrintfulAPI::ShippingRate.list( { address1: '12372 Carmel Country Rd', city: 'San Diego', country_code: 'US', state_code: 'CA', zip: 92130}, [{quantity: 2, variant_id: PrintfulAPI::Product.get(1).variants.first.id}], 'USD'  )

shipping_rate = shipping_rates.first

shipping_rate.id # "USPS_FIRST"
shipping_rate.name # "USPS First Class Mail (3-5 business days after fulfillment)"
shipping_rate.rate # "3.05"
shipping_rate.currency # "USD"

```

``` ruby

# tax rates Printful will charge on orders to a specific location
tax_rate = PrintfulAPI::TaxRate.get( country_code: 'US', state_code: 'CA', city: 'San Diego', zip: 92130  )
tax_rate.required # true
tax_rate.rate # 0.775
tax_rate.shipping_taxable # false

```

## Country/State Lists

``` ruby

# list all countries that are valid for Printful shipping.  A country and State
# core a required for orders, when available from this api.
countries = PrintfulAPI::Country.list()
country = countries.find{|country| country.code == 'US' }

# use the code values when referencing a country or state in an order

country.code # "US"
country.name # "United States"

# a list of states/provinces/regions for that country
country.states # State[]

country.states.first.code # "AA"
country.states.first.name # "Armed Forces Americas (except Canada)"

```

[storedashboard]: https://www.printful.com/dashboard/store
[libraries]: https://www.printful.com/docs/libraries
[signup]: https://printful.com/a/amrap
