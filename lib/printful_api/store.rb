module PrintfulAPI

	class Store < APIResource

		api_attributes :id, :name, :website, :return_address, :billing_address, :payment_card, :created
		belongs_to :packing_slip #, class: 'PrintfulAPI::PackingSlip'


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
