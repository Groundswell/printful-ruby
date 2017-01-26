module PrintfulAPI

	module APIOperations

		module Delete

			def delete( id, opts={} )

				PrintfulAPI.request( :DELETE, "#{self.resource_path}/#{id}" )

			end

		end

	end

end
