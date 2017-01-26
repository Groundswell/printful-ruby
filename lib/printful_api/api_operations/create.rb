module PrintfulAPI

	module APIOperations

		module Create

			def create( params={}, opts={} )

				PrintfulAPI.request( :POST, self.resource_path, params: params )

			end

		end

	end

end
