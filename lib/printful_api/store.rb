module PrintfulAPI

	class Store < APIResource

		api_attributes :id, :name, :website, :created
		belongs_to :packing_slip
		belongs_to :return_address, class: 'PrintfulAPI::Address'
		belongs_to :billing_address, class: 'PrintfulAPI::Address'
		belongs_to :payment_card, class: 'PrintfulAPI::CardInfo'


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
