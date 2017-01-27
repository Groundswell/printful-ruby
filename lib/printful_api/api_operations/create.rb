module PrintfulAPI

	module APIOperations

		module Create

			def self.included(base)
				base.extend(ClassMethods)
			end

			module ClassMethods

				def create( data={}, params={} )

					result = PrintfulAPI.request( :POST, params.delete(:resource_path) || self.resource_path, params: params, data: data )

					self.new.load_data( result )

				end

			end

		end

	end

end
