module PrintfulAPI

	module APIOperations

		module Save

			def save( opts = {} )

				if self.id.present?

					self.class.update( self.to_h, opts )

				else

					self.class.create( self.to_h, opts )

				end

			end

		end

	end

end
