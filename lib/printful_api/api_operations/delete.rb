module PrintfulAPI

	module APIOperations

		module Delete

			def self.included(base)
				base.extend(ClassMethods)
			end

			module ClassMethods

				def delete( id, opts={} )

					PrintfulAPI.request( :DELETE, "#{opts.delete(:resource_path) || self.resource_path}/#{id}" )

				end
				
			end

			def delete()
				self.class.delete( self.id )
			end

		end

	end

end
