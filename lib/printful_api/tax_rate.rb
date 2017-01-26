module PrintfulAPI

	class TaxRate < APIResource

		attr_accessor :required, :rate, :shipping_taxable

		# PrintfulAPI::TaxRate.get( country_code: 'US', state_code: 'CA', city: 'San Diego', zip: 92130  )
		def self.get( recipient = {}, opts = {} )

			data = PrintfulAPI.request( :POST, "/tax/rates", data: { recipient: recipient }, params: opts )

			model = self.new
			model.load_data( data )

			model

		end

	end

end
