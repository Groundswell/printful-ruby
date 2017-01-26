module PrintfulAPI

	module APIOperations

		module Create

			def create( data={}, params={} )

				PrintfulAPI.request( :POST, opts.delete(:resource_path) || self.resource_path, params: params, data: data )

			end

		end

	end

end
