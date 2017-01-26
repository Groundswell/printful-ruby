module PrintfulAPI

	class Store < APIResource

		api_attributes :id, :name, :website, :return_address, :billing_address, :payment_card, :packing_slip, :created

		def packing_slip=( data )
			@packing_slip ||= StorePackingSlip.new.load_data( data )
			@packing_slip
		end

		def self.get( opts={} )

			data = PrintfulAPI.request( :GET, self.resource_path )

			model = self.new
			model.load_data( data )

			model

		end

		def self.resource_path
			'/store'
		end

	end

end
