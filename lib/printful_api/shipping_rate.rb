module PrintfulAPI

	class ShippingRate < APIResource

		api_attributes :id, :name, :rate, :currency

		# PrintfulAPI::ShippingRate.list( { address1: '12372 Carmel Country Rd', city: 'San Diego', country_code: 'US', state_code: 'CA', zip: 92130}, [{quantity: 2, variant_id: PrintfulAPI::Product.get(1).variants.first.id}], 'USD'  )
		def self.list( recipient = {}, items = [], currency = 'USD', opts = {} )

			request_data = {
				recipient: recipient,
				items: items,
				currency: currency
			}

			results = PrintfulAPI.request( :POST, "/shipping/rates", data: request_data, params: opts )

			results.collect do |data|
				model = self.new
				model.load_data( data )

				model
			end

		end

	end

end
