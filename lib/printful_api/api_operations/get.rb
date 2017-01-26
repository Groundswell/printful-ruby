module PrintfulAPI

	module APIOperations

		module Get

			def self.included(base)
				base.extend(ClassMethods)
			end

			module ClassMethods

				def get( id, opts={} )

					data = PrintfulAPI.request( :GET, "#{opts.delete(:resource_path) || self.resource_path}/#{id}" )

					model = self.new
					model.load_data( data )

					model

				end

			end

		end

	end

end
