module PrintfulAPI

	class StorePackingSlip < APIResource

		attr_accessor :email, :phone, :message

		def self.get( opts={} )

			store = Store.get()

			store.packing_slip

		end

		def self.resource_path
			'/store/packing-slip'
		end

	end

end
