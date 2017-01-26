module PrintfulAPI

	class Country < APIResource
		extend PrintfulAPI::APIOperations::List

		attr_accessor :code, :name

		def self.list( filters={}, opts={} )
			taxable = filters.delete(:taxable)

			puts "Country.list taxable: #{taxable}, #{filters}, #{opts}"

			if taxable
				super( filters, opts.merge( resource_path: '/tax/countries' ) )
			else
				super( filters, opts )
			end
		end

		def states=( states_data )

			@states = nil

			if states_data.present?

				@states = states_data.collect do |state_data|
					PrintfulAPI::State.new.load_data( state_data )
				end

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
