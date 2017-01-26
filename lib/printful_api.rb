require 'printful_client'
require 'printful_api/api_resource'
require 'printful_api/api_operations/create'
require 'printful_api/api_operations/get'
require 'printful_api/api_operations/list'
require 'printful_api/country'
require 'printful_api/order'
require 'printful_api/product'
require 'printful_api/state'
require 'printful_api/variant'



module PrintfulAPI

	@@client = PrintfulClient.new( ENV['PRINTFUL_API_KEY'] )

	def self.api_key( api_key )
		@@client = PrintfulClient.new( api_key )
	end

	def self.request( method, path, opts = {} )

		puts "#{method}, #{path}, #{opts}"

		case method.to_s.upcase
		when "GET"
			@@client.get(path, opts[:params])
		when "DELETE"
			@@client.delete(path, opts[:params])
		when "POST"
			@@client.post(path, opts[:params], opts[:params])
		when "PUT"
			@@client.put(path, opts[:params], opts[:params])
		else
			die()
		end

	end

end
