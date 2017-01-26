module PrintfulAPI

	class Country < APIResource
		include PrintfulAPI::APIOperations::List

		api_attributes :code, :name
		has_many :states

		def self.list( filters={}, opts={} )
			taxable = filters.delete(:taxable)

			puts "Country.list taxable: #{taxable}, #{filters}, #{opts}"

			if taxable
				super( filters, opts.merge( resource_path: '/tax/countries' ) )
			else
				super( filters, opts )
			end
		end

		def states
			@states
		end

		def self.resource_path
			'/countries'
		end




	end

end
