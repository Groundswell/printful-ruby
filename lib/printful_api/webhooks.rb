module PrintfulAPI

	class Webhook < APIResource
		extend PrintfulAPI::APIOperations::Create

		attr_accessor :url, :types, :params

		def self.get( opts={} )

			data = PrintfulAPI.request( :GET, self.resource_path )

			model = self.new
			model.load_data( data )

			model

		end

		def self.delete( opts={} )

			PrintfulAPI.request( :DELETE, self.resource_path )

		end

		def self.resource_path
			'/webhooks'
		end

	end

end
