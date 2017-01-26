module PrintfulAPI

	module APIOperations

		module Update

			def self.included(base)
				base.extend(ClassMethods)
			end

			module ClassMethods

				def update( id, data={}, params={} )

					PrintfulAPI.request( :PUT, "#{self.resource_path}/#{id}", params: params, data: data )

				end
			end

		end

	end

end
