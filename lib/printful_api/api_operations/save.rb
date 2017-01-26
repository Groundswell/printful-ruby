module PrintfulAPI

	module APIOperations

		module Save

			def save()

				data = PrintfulAPI.request( :GET, "#{opts.delete(:resource_path) || self.resource_path}/#{id}" )

				#@todo

			end

		end

	end

end
