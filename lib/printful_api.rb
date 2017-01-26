require 'printful_client'
require 'printful_api/api_resource'
require 'printful_api/api_operations/create'
require 'printful_api/api_operations/delete'
require 'printful_api/api_operations/get'
require 'printful_api/api_operations/list'
require 'printful_api/api_operations/save'
require 'printful_api/api_operations/update'
require 'printful_api/address'
require 'printful_api/country'
require 'printful_api/cost'
require 'printful_api/file'
require 'printful_api/gift_data'
require 'printful_api/item'
require 'printful_api/order'
require 'printful_api/packing_slip'
require 'printful_api/product'
require 'printful_api/shipping_rate'
require 'printful_api/state'
require 'printful_api/store'
require 'printful_api/tax_rate'
require 'printful_api/variant'
require 'printful_api/webhooks'



module PrintfulAPI

	@@client = PrintfulClient.new( ENV['PRINTFUL_API_KEY'] )

	def self.api_key( api_key )
		@@client = PrintfulClient.new( api_key )
	end

	def self.request( method, path, opts = {} )

		# puts "#{method}, #{path}, #{opts}"

		case method.to_s.upcase
		when "GET"
			@@client.get(path, opts[:params])
		when "DELETE"
			@@client.delete(path, opts[:params])
		when "POST"
			@@client.post(path, opts[:data], opts[:params])
		when "PUT"
			@@client.put(path, opts[:data], opts[:params])
		else
			die()
		end

	end

end
